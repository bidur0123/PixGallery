import 'package:flutter/material.dart';
import 'package:pixgallery/widgets/hower_zoom_container.dart';
import '../../models/image_model.dart';

class ImageGrid extends StatelessWidget {
  final List<ImageModel> images;
  final Function(String imageId) onTap;

  ImageGrid({required this.images, required this.onTap});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 4 : 2;

    double width = MediaQuery.of(context).size.width;

    double itemWidth = (width - (crossAxisCount + 1) * 20) / crossAxisCount;

    double containerHeight = itemWidth * 1.2;

    double imageHeight = containerHeight * 0.62;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: itemWidth / containerHeight,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return HoverZoomContainer(
          onTap: () => onTap(image.id),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  image.previewUrl,
                  fit: BoxFit.cover,
                  height: imageHeight,
                  width: double.infinity,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return const Center(child: Icon(Icons.error, color: Colors.red));
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.remove_red_eye_rounded, size: 16, color: Colors.white),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '${image.views}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.thumb_up, size: 16, color: Colors.white),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '${image.likes}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


