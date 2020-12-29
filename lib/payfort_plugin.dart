
import 'dart:async';

import 'package:flutter/services.dart';

class PayfortPlugin {
  static const MethodChannel _channel =
      const MethodChannel('agm.flutter.apps/e-commerce');

  static Future<String> get payfort async {
    final String version = await _channel.invokeMethod('getID');
    return version;
  }
}
