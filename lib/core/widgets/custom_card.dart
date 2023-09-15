// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.color,
    required this.child,
    this.elevationColor,
  }) : super(key: key);
  final Color? color;
  final Widget child;
  final Color? elevationColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).brightness == Brightness.light
                    ? elevationColor ??
                        Theme.of(context)
                            .colorScheme
                            .inverseSurface
                            .withOpacity(0.3)
                    : elevationColor ?? Colors.black26,
                offset: const Offset(1, 1),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }
}
