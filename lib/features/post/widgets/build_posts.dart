// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:level1_hiring_app/core/widgets/responsive.dart';
import 'package:level1_hiring_app/features/post/blocs/get_post_bloc/get_post_bloc.dart';
import 'package:level1_hiring_app/features/post/models/post_model.dart';
import 'package:level1_hiring_app/features/post/widgets/post_card.dart';

class BuildPosts extends StatefulWidget {
  const BuildPosts({
    Key? key,
    required this.posts,
    this.crossAxisCount,
  }) : super(key: key);
  final List<PostModel> posts;
  final int? crossAxisCount;

  @override
  State<BuildPosts> createState() => _BuildPostsState();
}

class _BuildPostsState extends State<BuildPosts> {
  Future<void> _refresh() async {
    context.read<GetPostBloc>().add(GetPosts());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: widget.crossAxisCount == 1 ? 300.h : 200.h,
              crossAxisCount: widget.crossAxisCount != null
                  ? widget.crossAxisCount!
                  : ResponsiveWidget.isMobile(context)
                      ? 2
                      : 3,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 20.h),
          itemCount: widget.posts.length,
          itemBuilder: (_, index) => PostCard(
                post: widget.posts[index],
              )),
    );
  }
}
