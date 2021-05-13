# RxSVP

[![CI Status](https://img.shields.io/travis/hi@liangdahong.com/RxSVP.svg?style=flat)](https://travis-ci.org/hi@liangdahong.com/RxSVP)
[![Version](https://img.shields.io/cocoapods/v/RxSVP.svg?style=flat)](https://cocoapods.org/pods/RxSVP)
[![License](https://img.shields.io/cocoapods/l/RxSVP.svg?style=flat)](https://cocoapods.org/pods/RxSVP)
[![Platform](https://img.shields.io/cocoapods/p/RxSVP.svg?style=flat)](https://cocoapods.org/pods/RxSVP)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

RxSVP is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RxSVP'
```

```swift
textField.rx.text.orEmpty
    .filter { $0.count > 5 }
    .map { _ in () }
    .bind(to: SVProgressHUD.rx.info(status: "密码不可以大于 5 位"))
    .disposed(by: rx.disposeBag)

loginButton.rx.tap
    .bind(to: SVProgressHUD.rx.loading(status: "登录中..."))
    .disposed(by: rx.disposeBag)

infoButton.rx.tap
    .map { _ in "请登录" }
    .bind(to: SVProgressHUD.rx.info)
    .disposed(by: rx.disposeBag)

errorButton.rx.tap
    .map { _ in "网络错误" }
    .bind(to: SVProgressHUD.rx.error)
    .disposed(by: rx.disposeBag)

succesButton.rx.tap
    .bind(to: SVProgressHUD.rx.success(status: "登录成功"))
    .disposed(by: rx.disposeBag)

dismissButton.rx.tap
    .bind(to: SVProgressHUD.rx.dismiss)
    .disposed(by: rx.disposeBag)
```

## Author

hi@liangdahong.com

## License

RxSVP is available under the MIT license. See the LICENSE file for more info.
