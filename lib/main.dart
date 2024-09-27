import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'routes/app_pages.dart';
import 'utils/theme.dart';

class AppConfig {
  static String apiKey = '';

  static Future<void> loadConfig() async {
    final configString = await rootBundle.loadString('assets/config.json');
    final configData = json.decode(configString);
    apiKey = configData['api_key'];
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.loadConfig();
  runApp(PixGalleryApp());
}

class PixGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PixGallery',
      initialRoute: '/',
      getPages: AppPages.pages,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
