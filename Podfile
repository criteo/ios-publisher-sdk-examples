platform :ios, '13.2'

workspace 'CriteoSamples'

project 'AppBidding-GoogleAdManager/AppBidding-GoogleAdManager.xcodeproj'

target 'AppBidding-GoogleAdManager' do
  project 'AppBidding-GoogleAdManager/AppBidding-GoogleAdManager.xcodeproj'
  use_frameworks!

  pod 'Google-Mobile-Ads-SDK', '~> 7.60'
  pod 'CriteoPublisherSdk', '~> 3.10.0'
end

project 'AppBidding-MoPub/AppBidding-MoPub.xcodeproj'

target 'AppBidding-MoPub' do
  project 'AppBidding-MoPub/AppBidding-MoPub.xcodeproj'
  use_frameworks!

  pod 'mopub-ios-sdk', '~> 5.13.0'
  # To use a different major Criteo SDK version for just a single project,
  # we need manual installation. Once all projects are upgraded to v4,
  # we can switch back to Cocoapods by removing the comment below
  #pod 'CriteoPublisherSdk', '~> 4.0.3'
end

target 'Standalone' do
  project 'Standalone/Standalone.xcodeproj'
  use_frameworks!

  pod 'CriteoPublisherSdk', '~> 3.10.0'
end
