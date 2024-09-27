class ImageModel {
  final String id;
  final String previewUrl;
  final String webFormatUrl;
  final int views;
  final int likes;
  final String user;
  final String largeImageUrl;

  ImageModel({
    required this.id,
    required this.previewUrl,
    required this.webFormatUrl,
    required this.views,
    required this.likes,
    required this.user,
    required this.largeImageUrl,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'].toString(),
      previewUrl: json['previewURL'],
      webFormatUrl: json['webformatURL'],
      views: json['views'],
      likes: json['likes'],
      user: json['user'],
      largeImageUrl: json['largeImageURL'],
    );
  }
}
