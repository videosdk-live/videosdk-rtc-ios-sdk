#
# Be sure to run `pod lib lint VideoSDKRTC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VideoSDKRTC'
  s.version          = '2.2.6'
  s.summary          = 'Interactive Video API Experiences for Developers.'

  s.description      = <<-DESC
Video sdk enables opportunity to integrate immersive video experiences into your application.
                       DESC

  s.homepage         = 'https://github.com/videosdk-live/videosdk-rtc-ios-sdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zujo Tech Pvt Ltd.' => 'support@zujo.io' }
  s.source           = { :git => 'https://github.com/videosdk-live/videosdk-rtc-ios-sdk.git', :tag => 'v2.2.6' }

  s.swift_version = '5.0'
  s.ios.deployment_target = '13.0'
  s.dependency 'Socket.IO-Client-Swift', '16.1.1'

  #s.source_files = 'VideoSDK/**/*'
  
  # s.resource_bundles = {
  #   'VideoSDK' => ['VideoSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  # output frameworks
  s.vendored_frameworks = 'Frameworks/VideoSDKRTC.xcframework', 'Frameworks/Mediasoup.xcframework', 'Frameworks/WebRTC.xcframework'
  
  # default bulid settings
  s.xcconfig = {
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'OTHER_SWIFT_FLAGS' => '-Xcc -Wno-error=non-modular-include-in-framework-module',
    'ENABLE_BITCODE' => 'NO',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
    'SKIP_INSTALL' => 'NO'
  }
  
end
