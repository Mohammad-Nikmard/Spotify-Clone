import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/data/model/podcast.dart';

class PodcastAvatarWidget extends StatelessWidget {
  const PodcastAvatarWidget({super.key, required this.podcast});
  final Podcast podcast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: MyColors.greenColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            image: DecorationImage(
              image: AssetImage("images/podcasts/${podcast.image}"),
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
            podcast.name,
            style: const TextStyle(
              fontFamily: "AB",
              fontSize: 12,
              color: MyColors.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
