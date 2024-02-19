import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/data/model/artist.dart';

class ArtistAvatar extends StatelessWidget {
  const ArtistAvatar({super.key, required this.artist});
  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: AssetImage(
            "images/artists/${artist.artistImage!}",
          ),
        ),
        const SizedBox(height: 10),
        Text(
          artist.artistName!,
          style: const TextStyle(
            fontFamily: "AB",
            fontSize: 12,
            color: MyColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
