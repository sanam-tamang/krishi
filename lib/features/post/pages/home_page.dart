// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:level1_hiring_app/common/app_routes.dart';
import 'package:level1_hiring_app/features/post/blocs/get_post_bloc/get_post_bloc.dart';
import 'package:level1_hiring_app/features/post/widgets/build_posts.dart';
import 'package:level1_hiring_app/features/setting/widgets/drawer.dart';

import '../../../core/widgets/failure_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      appBar: AppBar(
        title: const Text("Krishi"),
        actions: [
          IconButton(
              onPressed: navigateToSearchPage,
              icon: const Icon(
                Icons.search,
              )),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
      body: BlocBuilder<GetPostBloc, GetPostState>(
        builder: (context, state) {
          if (state is GetPostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetPostLoaded) {
            return BuildPosts(posts: state.posts);
          } else if (state is GetPostFailure) {
            return CustomFailureWidget(
              message: state.message,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void navigateToSearchPage() =>
      Navigator.of(context).pushNamed(AppRouteName.searchPage);
}
