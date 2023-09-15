import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/annoted_region.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/widgets/custom_youtube_player_widget.dart';
import '../models/post_model.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({
    Key? key,
    required this.post,
    required this.videoId,
  }) : super(key: key);

  final PostModel post;
  final String videoId;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: widget.videoId,
        flags: const YoutubePlayerFlags(autoPlay: true));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAnnotatedRegion(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: CustomYoutubePlayerWidget(
                youtubeController: _controller,
                child: Expanded(
                    child: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                  children: [
                    Text(widget.post.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.w600))
                        .animate()
                        .fade(),
                    const SizedBox(height: 12),
                    Text(widget.post.body,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontSize: 15.sp, height: 1.2))
                        .animate()
                        .fade(),
                  ],
                )),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
