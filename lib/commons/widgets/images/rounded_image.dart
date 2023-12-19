import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    this.border,
    this.padding,
    this.fit = BoxFit.contain,
    this.backgroundColor,
    this.isNetworkImage = false,
    this.applyImageRadius = false,
    required this.imageUrl,
    this.onPressed,
    this.borderRadius = TSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
          borderRadius: BorderRadius.circular(TSizes.md),
        ),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider,
              fit: fit,
            )),
      ),
    );
  }
}
