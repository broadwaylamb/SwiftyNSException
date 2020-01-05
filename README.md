# SwiftyNSException

[![Build Status](https://travis-ci.org/broadwaylamb/SwiftyNSException.svg?branch=master)](https://travis-ci.org/broadwaylamb/SwiftyNSException)
[![codecov](https://codecov.io/gh/broadwaylamb/SwiftyNSException/branch/master/graph/badge.svg)](https://codecov.io/gh/broadwaylamb/SwiftyNSException)
![Language](https://img.shields.io/badge/Swift-5.0-orange.svg)
![Platform](https://img.shields.io/cocoapods/p/SwiftyNSException.svg?style=flat)
![Cocoapods](https://img.shields.io/cocoapods/v/SwiftyNSException.svg?style=flat)

SwiftyNSException adds conformance to `Error` protocol for `NSException` and provides a wrapper function that
catches an Objective-C exception and rethrows it in Swift so you can catch it using the `do-catch` block.

## Requirements

* Swift 5
* iOS 8.0+
* macOS 10.9+
* tvOS 9.0+
* watchOS 2.0+

## Installation

#### CocoaPods

For the latest release in CocoaPods add the following to your `Podfile`:

```ruby
use_frameworks!

pod 'SwiftyNSException'
```

For the latest dev build:

```ruby
use_frameworks!

pod 'SwiftyHaru', :git => 'https://github.com/broadwaylamb/SwiftyNSException.git', :branch => 'master'
```

## Usage

Use the generic function `handle(_:)` to wrap some code that can throw an NSException.

```swift

import SwiftyNSException

do {

    let result = try handle { () -> String in

        // Some invocation that can throw an NSException

        return "OK"
    }

    // The type of `result` is `String`.

} catch let exception as NSException {

    // Handle the exception

} catch {

    // Handle some other error thrown.

}
```
