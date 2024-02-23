import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/data/model/artist.dart';

class ArtistAvatar extends StatefulWidget {
  const ArtistAvatar({
    super.key,
    required this.artist,
  });
  final Artist artist;

  @override
  State<ArtistAvatar> createState() => _ArtistAvatarState();
}

class _ArtistAvatarState extends State<ArtistAvatar> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage(
                    "images/artists/${widget.artist.artistImage!}",
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.artist.artistName!,
                  style: const TextStyle(
                    fontFamily: "AB",
                    fontSize: 12,
                    color: MyColors.whiteColor,
                  ),
                ),
              ],
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
      ),
    );
  }
}
