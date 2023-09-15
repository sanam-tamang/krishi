import 'package:flutter/material.dart';

class ShowAssetImage extends StatelessWidget {
  const ShowAssetImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(
            
            image: DecorationImage(image: AssetImage(image))),
    );
  }
}
