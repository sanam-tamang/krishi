// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:level1_hiring_app/common/app_colors.dart';
import 'package:level1_hiring_app/common/image_resource.dart';
import 'package:level1_hiring_app/core/widgets/custom_cached_network_image.dart';
import 'package:level1_hiring_app/core/widgets/custom_card.dart';
import 'package:level1_hiring_app/core/widgets/rounded_icon_with_label.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:level1_hiring_app/common/app_routes.dart';
import 'package:level1_hiring_app/features/post/models/post_model.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);
  final PostModel post;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final String videoUrl = "https://www.youtube.com/watch?v=ODbIfXy0KZQ";
  late final String? videoPlayerId;
  late final String thumbnail;
  @override
  void initState() {
    videoPlayerId = YoutubePlayer.convertUrlToId(videoUrl);
 thumbnail = YoutubePlayer.getThumbnail(videoId: videoPlayerId!);


    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToDetailPage,
      child: CustomCard(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: _buildTitle(context)),
                const SizedBox(
                  height: 15,
                ),
                _buildSocialIconWithText(),
              ],
            ),
            Positioned(
                left: 0, right: 0, bottom: 0, child: _buildYoutubePlayer())
          ],
        ),
      ),
    );
  }

  AspectRatio _buildYoutubePlayer() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: AbsorbPointer(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CustomCachedNetworkImage(

                
                imageUrl: thumbnail,
              ))),
    );
  }

  RounndedIconWithLabel _buildSocialIconWithText() {
    return  RounndedIconWithLabel(
      label: 'Youtube',
      image: ImageResources.youtube,
          
      backgroundColor: AppColors.youtubeRed,
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      widget.post.title,
      textAlign: TextAlign.left,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
          height: 1.2,
          color: Theme.of(context).colorScheme.onSurface),
    );
  }

  void navigateToDetailPage() {
    Navigator.of(context).pushNamed(AppRouteName.detailPage,
        arguments: {"post": widget.post, "videoPlayerId": videoPlayerId});
  }
}
