import 'package:flutter/material.dart';
import '../../common/image_resource.dart';
import '../post/pages/home_page.dart';

class LoadRQM extends StatefulWidget {
  const LoadRQM({super.key});

  @override
  State<LoadRQM> createState() => _LoadRQMState();
}

class _LoadRQMState extends State<LoadRQM> {
  @override
  void didChangeDependencies() {
    ///loading images before using it
    final notFoundImage = AssetImage(ImageResources.notFound);
    final searchImage = AssetImage(ImageResources.search);
    final noInternet = AssetImage(ImageResources.noInternet);
    final youtube = AssetImage(ImageResources.youtube);

    precacheImage(youtube, context);
    precacheImage(noInternet, context);
    precacheImage(notFoundImage, context);
    precacheImage(searchImage, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
