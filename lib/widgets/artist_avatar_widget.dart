import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';

class ArtistAvatar extends StatelessWidget {
  const ArtistAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundColor: MyColors.greenColor,
        ),
        SizedBox(height: 10),
        Text(
          "Drake",
          style: TextStyle(
            fontFamily: "AB",
            fontSize: 12,
            color: MyColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
