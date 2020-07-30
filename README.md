[![CI](https://github.com/criteo/ios-publisher-sdk-examples/workflows/CI/badge.svg)]()
[![License](https://img.shields.io/github/license/criteo/ios-publisher-sdk-examples.svg)]()

# Criteo Publisher SDK iOS Samples
This repository contain samples for different integration types offered by 
[Criteo Publisher SDK](https://github.com/criteo/ios-publisher-sdk).

Please refer to the [App Developer Portal](https://publisherdocs.criteotilt.com/app/ios/), 
for detailed setup and usage instructions.

# How to use
Clone or download this repository, run `pod install` in your terminal to download all dependencies, 
then open `CriteoSamples.xcworkspace` in Xcode.  Inside the workspace, there are multiple projects 
for each integration types and one additional `Pods` project to manage dependencies.

Choose a scheme to run on the top left corner of Xcode window, and then you can run the sample project on a simulator.

## Integrations with Ad Server
This project sufficiently show how to integrate with Criteo Publisher SDK and be able to display banners. 
On some integration types with ad server e.g. Google Ad Manager, MoPub, you will only see demo banners 
from these ad servers. In order to see Criteo test banners, you will need to setup Criteo line items and creatives 
in your ad server, and update the Ad Unit ID in the project to your Ad Unit ID.

# Questions & Support
Please contact your technical support representative for any questions about the SDK.

# License
[Apache License v2.0](LICENSE)
