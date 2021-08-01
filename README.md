# DU21SmartOTPSwiftt

[![CI Status](https://img.shields.io/travis/kadkad195/DU21SmartOTPSwiftt.svg?style=flat)](https://travis-ci.org/kadkad195/DU21SmartOTPSwiftt)
[![Version](https://img.shields.io/cocoapods/v/DU21SmartOTPSwiftt.svg?style=flat)](https://cocoapods.org/pods/DU21SmartOTPSwiftt)
[![License](https://img.shields.io/cocoapods/l/DU21SmartOTPSwiftt.svg?style=flat)](https://cocoapods.org/pods/DU21SmartOTPSwiftt)
[![Platform](https://img.shields.io/cocoapods/p/DU21SmartOTPSwiftt.svg?style=flat)](https://cocoapods.org/pods/DU21SmartOTPSwiftt)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DU21SmartOTPSwiftt is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DU21SmartOTPSwiftt'
```

## Author

kadkad195, dat.pham.kad@gmail.com

## License

DU21SmartOTPSwiftt is available under the MIT license. See the LICENSE file for more info.

Easy implement Smart OTP into you projects.

## Step1:

*  @param period: otp will be expired after that period. Default 30000 = 30s
*  @param digit: length of otp value. Default 6
*  @param generateTime: how many otp will be generated. Default 2
```
val smartOTP = DU21SmartOTP(period, digit, generateTime)
```
```
val shareKey = smartOTP.createShareKey("YOUR_SECRET") //Should be your PIN code + your device id
```
Then send this secret to server to register. Your server will use this secret to generate OTP too


## Step2:
* register listenser and expired handler
```
smartOTP.listenerOTP: Listener will return current otp and seconds before expired
smartOTP.listenerOTPExpired: Listener invoke when otp is expired 
```

## Step3:
* Each time create otp, inout your secret (PIN, password,....) as you use to generate shareKey to generate right OTP
* If input wrong secret -> Your OTP will be wrong
```
smartOTP.createTOTP("YOUR_SECRET")
```

## Step4:
* Use clear() when stop using
```
smartOTP.clear()
```

## Create TOTP From ShareKey:
```
smartOTP.createTOTPFromShareKey(shareKey)
```
## Min: IOS 13. Must be Allow Arbitrary Loads
