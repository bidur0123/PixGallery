import 'package:get/get.dart';
import '../controllers/gallery_controller.dart';
import '../controllers/auth_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GalleryController());
    Get.lazyPut(() => AuthController());
  }
}
