import 'package:flutter/material.dart';
import 'package:level1_hiring_app/core/widgets/show_asset_image.dart';


///help to show label with icon with rounded container
class RounndedIconWithLabel extends StatelessWidget {
  const RounndedIconWithLabel({
    Key? key,
    required this.label,
    required this.image,
    required this.backgroundColor,
  }) : super(key: key);
  final String label;
  final String image;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 45, child: ShowAssetImage(image: image)),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
