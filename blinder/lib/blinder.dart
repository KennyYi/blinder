
import 'dart:async';

import 'package:flutter/services.dart';

class Blinder {
  static const MethodChannel _channel =
      const MethodChannel('blinder');

  static Future<void> blind() async => await _channel.invokeMethod('blind');

  static Future<void> open() async => await _channel.invokeMethod('open');
}
