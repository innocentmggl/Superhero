//
//  SearchManager.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import Foundation

/// Protocol that handles API requests  throotling and duplicate API requests
protocol SearchManager {
    func debounce(forSearch: String, action: @escaping (() -> Void))
}

/// Simple class that implements `SearchManager` protocol
public final class DefaultSearchManager: SearchManager {

    private var currentWorkItem: DispatchWorkItem?
    private var resultsFor: String?
    private let delay: DispatchTimeInterval
    private let queue: DispatchQueue

    init(delay: DispatchTimeInterval = .milliseconds(500), queue: DispatchQueue = .main) {
        self.delay = delay
        self.queue = queue
    }
    /**
     Schdule work after after a delay  .

     - Parameters:
        - forSerch: the `String` search term.
     */
    func debounce(forSearch: String, action: @escaping (() -> Void)) {
        self.currentWorkItem?.cancel()
        self.currentWorkItem = DispatchWorkItem {[weak self] in
            if self?.resultsFor != forSearch {
                self?.resultsFor = forSearch
                action()
            }
        }
        self.queue.asyncAfter(deadline: .now() + self.delay, execute: self.currentWorkItem!)
    }
}
