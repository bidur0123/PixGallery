import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pixgallery/utils/constants.dart';

import '../models/image_model.dart';

class GalleryController extends GetxController {
  var images = <ImageModel>[].obs;
  var isLoading = false.obs;
  var page = 1;

  final String baseUrl = 'https://pixabay.com/api/';

  @override
  void onInit() {
    super.onInit();
    AppConfig.loadConfig().then((_) {
      fetchImages();
    });
  }

  Future<void> fetchImages({String query = ''}) async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(
          '$baseUrl?key=${AppConfig.apiKey}&q=$query&image_type=photo&per_page=20&page=$page'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<ImageModel> fetchedImages = List<ImageModel>.from(
            data['hits'].map((imageData) => ImageModel.fromJson(imageData)));

        images.addAll(fetchedImages);
        page++;
      }
    } catch (e) {
      print('Error fetching images: $e');
    } finally {
      isLoading(false);
    }
  }
}
