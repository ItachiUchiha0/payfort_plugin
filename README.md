# payfort_plugin

A flutter plugin to help flutter developer to integrate with payfort SDK easily, it supports android and ios.


## Getting Started

Add this to pubspec.yaml

```dart
dependencies:
  payfort_plugin: ^0.1.8
```

### Usage

```dart
PayfortPlugin.getID.then((value) => { //use this call to get device id and send it to server
                         PayfortPlugin.performPaymentRequest(
                              'YOR_MERCHANT_REF',
                              'YOUR_SDK_TOKEN',
                              'name',
                              'language',
                              'user@mail.com',
                              'amount',
                              'PURCHASE',
                              'Currency').then((value) => {
                                debugPrint('card number is ${value['card_number']}')
                         })

                  });
```
### Contributing 

We Accept the following contributions

* Improving code documentation 
* Reporting issues
* bug fixing

## Maintainers

Magints


