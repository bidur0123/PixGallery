import 'package:get/get.dart';
import '../services/firebase_service.dart';

class AuthController extends GetxController {
  var userName = ''.obs;

  void setUserName(String name) {
    userName.value = name;
  }

  Future<void> likeImage(String imageId) async {
    if (userName.value.isNotEmpty) {
      await FirebaseService.likeImage(imageId, userName.value);
    }
  }
}
