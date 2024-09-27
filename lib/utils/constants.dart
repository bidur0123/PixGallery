import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AppConfig {
  static String apiKey = '';

  static Future<void> loadConfig() async {
    // Load the config.json file from the assets
    final configString = await rootBundle.loadString('assets/config.json');
    final configData = json.decode(configString);
    apiKey = configData['api_key'];
  }
}
