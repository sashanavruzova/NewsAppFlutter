import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:yaml/yaml.dart';

class Config {
  static late final String apiKey;

  static Future<void> load() async {
    try {
      final configYaml = await rootBundle.loadString('assets/config.yaml');
      final configJson = jsonDecode(jsonEncode(loadYaml(configYaml)));
      apiKey = configJson['api_key'];
    } catch (e) {
      print('Failed to load config file: $e');
    }
  }
}
