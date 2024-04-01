import 'package:assignment_project/src/core/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class GifItemContainer extends StatelessWidget {
  const GifItemContainer({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 100,
      child: Image.network(
        imageUrl,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (frame != null) {
            return child;
          }
          return const ImageLoader();
        },
      ),
    );
  }
}
