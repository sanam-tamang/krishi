// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
  }) : super(key: key);
  final String imageUrl;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.grey,
      )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
