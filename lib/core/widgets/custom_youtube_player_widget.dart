// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubePlayerWidget extends StatelessWidget {
  const CustomYoutubePlayerWidget({
    Key? key,
    required this.youtubeController,
    this.child,
  }) : super(key: key);

  final YoutubePlayerController youtubeController;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        onExitFullScreen: () {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
              overlays: SystemUiOverlay.values);
        },
        builder: (context, player) {
          return Scaffold(
            body: Column(
              children: [
                Flexible(child: player),
                child ?? const SizedBox.shrink()
              ],
            ),
          );
        },
        player: YoutubePlayer(
          controller: youtubeController,
          showVideoProgressIndicator: true,
          progressColors: ProgressBarColors(
            playedColor: Theme.of(context).colorScheme.primary,
            handleColor: Theme.of(context).colorScheme.primary,
          ),
        ));
  }
}
