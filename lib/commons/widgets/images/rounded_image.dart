import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:winter_store/commons/widgets/shimmer/shimmer_effect.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    this.border,
    this.padding,
    this.fit = BoxFit.contain,
    this.backgroundColor,
    this.overlayColor,
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
  final Color? overlayColor;
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
        alignment: Alignment.center,
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
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  imageUrl: imageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgess) =>
                      ShimmerEffect(
                          width: width ?? double.infinity,
                          height: height ?? double.infinity),
                  errorWidget: (context, url, error) => const Icon(Icons.error))
              : Image(
                  color: overlayColor,
                  image: AssetImage(imageUrl),
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
