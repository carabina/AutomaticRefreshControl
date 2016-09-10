#
# Be sure to run `pod lib lint AutomaticRefreshControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AutomaticRefreshControl'
  s.version          = '0.1.0'
  s.summary          = 'UIRefreshControl subclass which reveals itself on beginRefreshing(), even on iOS10!'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
AutomaticRefreshControl seeks to behave the way I personally expected UIRefreshControl to work when I first discovered it. 1) AutomaticRefreshControl reveals itself on beginRefreshing() which allows you to trigger it programmatically. 2) AutomaticRefreshControl fixes an issue where a UIRefreshControl's tintColor is not applied the first time the control is displayed; which makes it completely invisible on iOS 10. While the solution here is pretty hacky, it works!
                       DESC

  s.homepage         = 'https://github.com/jeffreyfultonca/AutomaticRefreshControl'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jeffrey Fulton' => 'jeffrey.fulton@me.com' }
  s.source           = { :git => 'https://github.com/jeffreyfultonca/AutomaticRefreshControl.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'AutomaticRefreshControl/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AutomaticRefreshControl' => ['AutomaticRefreshControl/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
