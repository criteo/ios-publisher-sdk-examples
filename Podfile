platform :ios, '13.2'

workspace 'CriteoSamples'

project 'AppBidding-GoogleAdManager/AppBidding-GoogleAdManager.xcodeproj'

target 'AppBidding-GoogleAdManager' do
  project 'AppBidding-GoogleAdManager/AppBidding-GoogleAdManager.xcodeproj'
  use_frameworks!

  pod 'Google-Mobile-Ads-SDK', '~> 10.0'
  pod 'CriteoPublisherSdk', '~> 4.9.0'
end

target 'Standalone' do
  project 'Standalone/Standalone.xcodeproj'
  use_frameworks!

  pod 'CriteoPublisherSdk', '~> 4.9.0'
end
