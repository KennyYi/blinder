import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blinder/blinder.dart';

void main() {
  const MethodChannel channel = MethodChannel('blinder');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return null;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
