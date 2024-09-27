import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/gallery_controller.dart';
import '../widgets/image_grid.dart';
import '../widgets/loading_indicator.dart';

class HomeScreen extends StatelessWidget {
  final GalleryController galleryController = Get.put(GalleryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PixGallery")),
      body: Obx(() {
        if (galleryController.isLoading.value && galleryController.images.isEmpty) {
          return Center(child: LoadingIndicator());
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
                !galleryController.isLoading.value) {
              galleryController.fetchImages();
            }
            return false;
          },
          child: ImageGrid(
            images: galleryController.images,
            onTap: (imageId) {
              Get.toNamed('/image/$imageId');
            },
          ),
        );
      }),
    );
  }
}
