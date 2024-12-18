import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/asset_app.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? url;
  final double? height;
  final double? width;
  final double? borderRadius;
  final BoxFit? fit;
  final bool? isCanZoom;
  final VoidCallback? onTap;
  final Widget? errorWidget;
  final Widget? placeholder;

  const CustomNetworkImage(
      {super.key,
      this.url,
      this.height,
      this.width,
      this.borderRadius = 0,
      this.fit = BoxFit.cover,
      this.isCanZoom = false,
      this.onTap,
      this.errorWidget,
      this.placeholder});

  @override
  Widget build(BuildContext context) {
    Widget customPhoto(double? heightx, double? widthx, BoxFit? fitx, double? radius) {
      return CachedNetworkImage(
        imageUrl: url.toString(),
        placeholder: (context, url) =>
            placeholder ??
            Container(
              height: heightx ?? 0,
              width: heightx ?? 0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radius ?? 0),
              ),
              child: SvgPicture.asset(
                IconApp.placeholder,
              ),
            ),
        errorWidget: (context, url, error) =>
            errorWidget ??
            Container(
              height: heightx ?? 0,
              width: heightx ?? 0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radius ?? 0),
              ),
              child: SvgPicture.asset(
                IconApp.placeholder,
              ),
            ),
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
