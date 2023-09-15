import 'package:flutter/material.dart';
import '../features/load_rqm/load_rqm.dart';
import '../features/post/pages/post_detail_page.dart';
import '../features/search/pages/search_page.dart';

class AppRouteName {
  static const String root = "/";
  static const String home = "/home";
  static const String detailPage = "/post-detail";
  static const String searchPage = "/search-post";
}

class AppRoute {
  static Route onGenerateRoute(RouteSettings setting) {
    return MaterialPageRoute(builder: (context) {
      switch (setting.name) {
        case AppRouteName.root:
          return const LoadRQM();
        case AppRouteName.detailPage:
          Map<String, dynamic> map = setting.arguments as Map<String, dynamic>;
          return PostDetailPage(
            post: map['post'],
            videoId: map['videoPlayerId'],
          );

        case AppRouteName.searchPage:
          return const SearchPage();
        default:
          return const Scaffold(
            body: Text("Error routing"),
          );
      }
    });
  }
}
