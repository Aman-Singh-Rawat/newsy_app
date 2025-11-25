import 'package:flutter/cupertino.dart';
import 'package:newsy/app/constants/image_strings.dart';

class ImageError extends StatelessWidget {
  final double width;
  final double height;
  final BoxFit fit;
  final String image;
  const ImageError({
    super.key,
    this.image = ImageStrings.imgError,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: width, height: height, fit: fit);
  }
}
