# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

plugin 'cocoapods-keys', {
  :project => "Superhero",
  :target => "Superhero",
  :keys => [
    "AccessToken"
  ]
}

target 'Superhero' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Superhero
  pod 'SwiftLint'
  pod 'Moya', '~> 14.0'
  pod 'SDWebImage', '~> 5.0'
  pod 'Charts'

  target 'SuperheroTests' do
    inherit! :search_paths
    # Pods for testing
    pod "Cuckoo"
    pod "Nimble"
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '5.2'
      end
    end
  end

end

