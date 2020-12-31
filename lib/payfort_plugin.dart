import 'dart:async';

import 'package:flutter/services.dart';

class PayfortPlugin {
  static const MethodChannel _channel =
      const MethodChannel('agm.flutter.apps/e-commerce');

  ///
  /// this method is for getting user device id to help in generating SDK token
  static Future<String> get getID async {
    final String version = await _channel.invokeMethod('getID');
    return version;
  }

  ///
  /// this method is for calling payfort sdk in both android and ios to perform payment process with
  /// specified parameters.
  static Future<Map> performPaymentRequest(
      String merchantRef,
      String sdkToken,
      String name,
      String language,
      String email,
      String amount,
      String command) async {
    Map result = await _channel.invokeMethod('initPayFort', {
      'sdkToken': sdkToken,
      'merchantRef': merchantRef,
      'amount': amount,
      'email': email,
      'lang': language,
      'command': command,
      'name': name,
    });
    return result;
  }
}
