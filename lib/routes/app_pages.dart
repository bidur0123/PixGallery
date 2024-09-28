import 'package:get/get.dart';

import '../views/home_screen.dart';
import '../views/image_detail_screen.dart';

class AppPages {
  static final pages = [
    GetPage(name: '/', page: () => HomeScreen()),
    GetPage(name: '/image/:id', page: () => ImageDetailScreen()),
  ];
}

