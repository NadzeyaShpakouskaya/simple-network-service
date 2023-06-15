# Network Service 

The repo contains a Swift Package with the implementation of the HTTP network service for the iOS platform.

⚠️ The Network service is under active development.

## Table of contents

* [General info](#general-info)
* [Installation](#installation)
* [Authors](#authors)

## Current dev environment 

| Dev environment| Ref link |
| --- | -- |
| ![macOS](https://img.shields.io/badge/macOS-13.3+-blue) |  
| ![Xcode](https://img.shields.io/badge/Xcode-14.3-red)   |
| ![Swift](https://img.shields.io/badge/Swift-5.8-orange) | 
| ![iOS](https://img.shields.io/badge/iOS-15%2B-lightgrey) | 
| ![SwiftFormat](https://img.shields.io/badge/SwiftFormat-0.51.7-yellow) | [Link](https://github.com/nicklockwood/SwiftFormat) |
| ![SwiftLint](https://img.shields.io/badge/SwiftLint-0.51.0-green)| [Link](https://github.com/realm/SwiftLint) |

## General info

The repo contains the source code of the NetworkService.

## Installation

**Pre-requisites**: _installed Xcode with the version specified under the [current dev environment](#current-dev-environment)._

[Swift Package Manager(SPM)](https://www.swift.org/package-manager/) is Apple's dependency manager tool.

To install Network Service package into your packages, add a reference to Network Service and a targeting release version in the dependencies section in Package.swift file:

import PackageDescription

``` swift
let package = Package(
    name: "YOUR_PROJECT_NAME",
    products: [],
    dependencies: [
        .package(url: "https://github.com/ios-course/simple-network-service.git", from: "0.1.0")
    ]
)
```

To install Network Service package via Xcode

Go to File -> Swift Packages -> Add Package Dependency...
Then search for https://github.com/ios-course/simple-network-service.git
And choose the version you want

## Authors

You can contact the authors by the following GitHub's usernames:

- Nadia Shpakouskaya: [@NadzeyaShpakouskaya](https://github.com/NadzeyaShpakouskaya)
- Alex Zavadskiy: [@iBYarchitect](https://github.com/iBYarchitect)
- Julya Kmita: [@julyakmita](https://github.com/julyakmita)
- Marina Tihonovich: [@marinkman](https://github.com/marinkman)
- Yuliya Nastiushkina: [@YuliaNastiushkina](https://github.com/YuliaNastiushkina)
- Ivan Kirpichonok: [@kirpichonok](https://github.com/kirpichonok)     
- Alex Levitski: [@levvaa](https://github.com/levvaa)

## License

[MIT License](https://opensource.org/license/mit/)
