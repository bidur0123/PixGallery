import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/image_model.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/gallery_controller.dart';

class LikeButton extends StatelessWidget {
  final ImageModel image;
  final AuthController authController = Get.put(AuthController());
  final GalleryController galleryController = Get.put(GalleryController());

  LikeButton({required this.image});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.thumb_up),
      onPressed: () {
        authController.likeImage(image.id);
      },
    );
  }
}
