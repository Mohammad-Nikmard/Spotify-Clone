import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';

class PodcastAvatarWidget extends StatelessWidget {
  const PodcastAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 105,
          decoration: const BoxDecoration(
            color: MyColors.greenColor,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          width: 100,
          child: Text(
            "The Joe Rogan Experience",
            style: TextStyle(
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
