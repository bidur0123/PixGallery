import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/image_model.dart';
import '../utils/constants.dart';

class ApiService {
  static Future<List<ImageModel>> fetchImages(int page) async {
    final response = await http.get(Uri.parse(
      'https://pixabay.com/api/?key=$api_key&image_type=photo&page=$page&per_page=20',
    ));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<ImageModel>.from(data['hits'].map((img) => ImageModel.fromJson(img)));
    } else {
      throw Exception('Failed to load images');
    }
  }
}
