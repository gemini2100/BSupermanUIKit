#
# Be sure to run `pod lib lint BSupermanUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BSupermanUIKit'
  s.version          = '0.3.3'
  s.summary          = 'A UIKit library for bsuperman.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A UIKit library for bsuperman project.example color,button,label....
                       DESC

  s.homepage         = 'https://github.com/gemini2100/BSupermanUIKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gemini2100' => 'gemini2100@msn.com' }
  s.source           = { :git => 'https://github.com/gemini2100/BSupermanUIKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'BSupermanUIKit/Classes/**/*'
  s.swift_version = '4.0'
  # s.resource_bundles = {
  #   'BSupermanUIKit' => ['BSupermanUIKit/Assets/*.png']
  # }

 s.resource_bundles = {
   'BSupermanUIKit' => ['BSupermanUIKit/*.xcassets']
 }


   s.frameworks = 'UIKit'
  
   s.dependency 'SnapKit'
   s.dependency 'RxSwift'
   s.dependency 'RxCocoa'
   s.dependency 'Nuke' 
   s.dependency 'Action' 
  s.dependency 'BSupermanFoundation', '~> 0.1.0'
   
end
