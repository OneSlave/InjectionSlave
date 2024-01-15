# InjectionSlave

[![CI Status](https://img.shields.io/travis/OneSlave/InjectionSlave.svg?style=flat)](https://travis-ci.org/OneSlave/InjectionSlave)
[![Version](https://img.shields.io/cocoapods/v/InjectionSlave.svg?style=flat)](https://cocoapods.org/pods/InjectionSlave)
[![License](https://img.shields.io/cocoapods/l/InjectionSlave.svg?style=flat)](https://cocoapods.org/pods/InjectionSlave)
[![Platform](https://img.shields.io/cocoapods/p/InjectionSlave.svg?style=flat)](https://cocoapods.org/pods/InjectionSlave)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
```
ios, "11.0"
```

## Installation

InjectionSlave is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'InjectionSlave', :configurations => ['Debug']
```

## Usage
```
#import <UIViewController+Injection.h>

- (void)injectedNotifi {
    [super injectedNotifi];
    // need reload code
    ...
}
```

## License

InjectionSlave is available under the MIT license. See the LICENSE file for more info.
