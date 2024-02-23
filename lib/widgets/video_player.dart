import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class BackVideoPlayer extends StatefulWidget {
  const BackVideoPlayer({super.key});

  @override
  State<BackVideoPlayer> createState() => _BackVideoPlayerState();
}

class _BackVideoPlayerState extends State<BackVideoPlayer> {
  late final VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('video/music-video.mp4')
      ..initialize().then((value) {
        controller.play();
        controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            height: controller.value.size.height,
            width: controller.value.size.width,
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          ),
        ),
      ],
    );
  }
}
