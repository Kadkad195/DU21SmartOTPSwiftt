#
# Be sure to run `pod lib lint DU21SmartOTPSwiftt.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DU21SmartOTPSwiftt'
  s.version          = '0.2.0'
  s.summary          = 'Easy to implement SmartOTP into your project'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Easy to implement SmartOTP into your project. This is created by e mamber of CMC GLOBAL
                       DESC

  s.homepage         = 'https://github.com/kadkad195/DU21SmartOTPSwiftt'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kadkad195' => 'dat.pham.kad@gmail.com' }
  s.source           = { :git => 'https://github.com/kadkad195/DU21SmartOTPSwiftt.git', :branch => "master", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'DU21SmartOTPSwiftt/Classes/*.{h,m,swift}', 'DU21SmartOTPSwiftt/Classes/SwiftOTP/*.{h,m,swift}', 'DU21SmartOTPSwiftt/Classes/SwiftOTP/Base32/*.{h,m,swift}'
  
  # s.resource_bundles = {
  #   'DU21SmartOTPSwiftt' => ['DU21SmartOTPSwiftt/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.swift_versions = '5.0'
end
