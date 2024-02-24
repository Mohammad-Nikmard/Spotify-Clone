import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/data/model/podcast.dart';

class PodcastAvatarWidget extends StatefulWidget {
  const PodcastAvatarWidget({super.key, required this.podcast});
  final Podcast podcast;

  @override
  State<PodcastAvatarWidget> createState() => _PodcastAvatarWidgetState();
}

class _PodcastAvatarWidgetState extends State<PodcastAvatarWidget> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 95,
                  decoration: BoxDecoration(
                    color: MyColors.greenColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image:
                          AssetImage("images/podcasts/${widget.podcast.image}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    widget.podcast.name,
                    style: const TextStyle(
                      fontFamily: "AB",
                      fontSize: 12,
                      color: MyColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 5,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: isTapped ? 1 : 0,
            child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: const Center(
                child: Icon(
                  Icons.done,
                  color: Colors.black,
                  weight: 5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
