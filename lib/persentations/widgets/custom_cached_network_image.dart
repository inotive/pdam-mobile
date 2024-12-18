import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/widgets/shimmer/shimmer_widget.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? url;
  final double? height;
  final double? width;
  final double? borderRadius;
  final BoxFit? fit;
  final bool? isCanZoom;
  final VoidCallback? onTap;
  final Widget? errorWidget;

  const CustomNetworkImage(
      {super.key,
      this.url,
      this.height,
      this.width,
      this.borderRadius = 0,
      this.fit = BoxFit.cover,
      this.isCanZoom = false,
      this.onTap,
      this.errorWidget});

  @override
  Widget build(BuildContext context) {
    Widget customPhoto(double? heightx, double? widthx, BoxFit? fitx, double? radius) {
      return CachedNetworkImage(
        imageUrl: url.toString(),
        placeholder: (context, url) => ShimmerWidget(
          height: heightx ?? 0,
          width: widthx ?? 0,
          radius: radius ?? 0,
        ),
        errorWidget: (context, url, error) => errorWidget ?? const Icon(Icons.error),
        height: heightx,
        width: widthx,
        fit: fitx,
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: customPhoto(height, width, BoxFit.fill, borderRadius),
      ),
    );
  }
}
