// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    Key? key,
    required this.mobile,
    required this.tab,
  }) : super(key: key);
  final Widget mobile;
  final Widget tab;
  static bool isMobile(BuildContext context) => MediaQuery.sizeOf(context).width < 600;
 static  bool isTab(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 600 &&
      MediaQuery.sizeOf(context).width < 900;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return isMobile(context) ? mobile : tab;
    });
  }
}
