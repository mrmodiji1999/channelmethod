import 'package:flutter/services.dart';

class MethodChannelHandler {
  static const MethodChannel _channel = MethodChannel('com.example.app/openCSV');

  static Future<void> openCSVFile(String filePath) async {
    try {
      await _channel.invokeMethod('openCSV', {'filePath': filePath});
    } on PlatformException catch (e) {
      print("Failed to open CSV file: '${e.message}'.");
    }
  }
}
