//
//  ShowDetailsViewController.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import UIKit
import SDWebImage
import Charts

class ShowDetailsViewController: UIViewController, StoryboardInstantiable {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var contentViewHeightMultiplier: NSLayoutConstraint!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var firstAppearedLabel: UILabel!
    @IBOutlet weak var chartsView: HorizontalBarChartView!

    private var viewModel: ShowDetailsViewModel!

    final class func create(with viewModel: ShowDetailsViewModel) -> ShowDetailsViewController {
        let view = ShowDetailsViewController.instantiate()
        view.viewModel = viewModel
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    private func configureViews() {
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.title = viewModel.superhero.name
        self.imageView.sd_setImage(with: viewModel.superhero.image.url, placeholderImage: UIImage(named: "placeholder.png"))
        if let fullName = viewModel.superhero.biography.fullName {
            fullNameLabel.text = "fullname".localized() + fullName
        }
        firstAppearedLabel.text = "first.appeared".localized() + viewModel.superhero.biography.firstAppearance
        setupChart()
    }

    func setupChart() {
        setupChartData()

        // General setting
        chartsView.setScaleEnabled(false)
        chartsView.xAxis.granularityEnabled = true
        chartsView.xAxis.granularity = 1

        // Grid
        chartsView.xAxis.drawGridLinesEnabled = false
        chartsView.leftAxis.gridLineDashLengths = [15.0, 15.0]
        chartsView.leftAxis.gridColor = UIColor.blue
        chartsView.rightAxis.drawGridLinesEnabled = false

        // Disable number formatting of leftAxis and rightAxis
        chartsView.leftAxis.enabled = false
        chartsView.rightAxis.enabled = false

        // setViewPortOffsets
        let digitCount = Int(100)
        let leftOffcet: CGFloat = digitCount > 2 ? CGFloat((digitCount - 1) * 10) : 10.0
        chartsView.setViewPortOffsets(left: leftOffcet, top: 0, right: 0, bottom: 50)
        chartsView.leftAxis.axisMinimum = 0
    }

    private func setupChartData() {
        let powerStats = getPowerStats()
        let barChartDataEntry = powerStats.enumerated().map { x, y -> BarChartDataEntry in
        return BarChartDataEntry(x: Double(x), y: Double(y))
        }
        let data = BarChartData()
        let dataSet = BarChartDataSet(entries: barChartDataEntry, label: "")
        dataSet.colors = [UIColor.lightGray, UIColor.purple, UIColor.darkGray, UIColor.orange, UIColor.green, UIColor.brown]
        dataSet.valueTextColor = UIColor.darkGray

        // Data set
        data.addDataSet(dataSet)
        chartsView.data = data
        chartsView.xAxis.valueFormatter = IndexAxisValueFormatter(values: ["Intelligence", "Strength", "Speed", "Durability", "Power", "Combat"])
    }

    private func getPowerStats() -> [Int] {
        let stats = viewModel.superhero.powerStats
        return [
            getStat(stat: stats.intelligence),
            getStat(stat: stats.strength),
            getStat(stat: stats.speed),
            getStat(stat: stats.durability),
            getStat(stat: stats.power),
            getStat(stat: stats.combat)
        ]
    }

    private func getStat(stat: String?) -> Int {
        guard let powerStat = stat, let value = Int(powerStat) else { return 0 }
        return value
    }
}
