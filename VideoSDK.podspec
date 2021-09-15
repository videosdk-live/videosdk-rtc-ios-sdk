#
# Be sure to run `pod lib lint VideoSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VideoSDKRTC'
  s.version          = '1.0.0'
  s.summary          = 'Interactive Video API Experiences for Develoeprs.'

  s.description      = <<-DESC
Video sdk enables opportunity to integrate immersive video experiences into your application.
                       DESC

  s.homepage         = 'https://github.com/videosdk-live/videosdk-rtc-ios-sdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zujo Tech Pvt Ltd.' => 'support@zujo.io' }
  s.source           = { :git => 'https://github.com/videosdk-live/videosdk-rtc-ios-sdk.git', :tag => 'v1.0.0' }

  s.ios.deployment_target = '12.0'
  #s.source_files = 'VideoSDK/Classes/**/*'
  
  # s.resource_bundles = {
  #   'VideoSDK' => ['VideoSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  # dependencies
  s.dependency 'Starscream'
  s.dependency 'SwiftyJSON'
  
  # output frameworks
  s.vendored_frameworks = 'Frameworks/VideoSDK.framework', 'Frameworks/vl_mediasoup_client_ios.framework', 'Frameworks/WebRTC.framework'
  
  # default bulid settings
  s.xcconfig = {
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'OTHER_SWIFT_FLAGS' => '-Xcc -Wno-error=non-modular-include-in-framework-module',
    'ENABLE_BITCODE' => 'NO'
  }
  
  # swift versions
  s.swift_versions = ['5.1', '5.2', '5.3']
  
end
