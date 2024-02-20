import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';

class AlbumChip extends StatelessWidget {
  const AlbumChip(
      {super.key,
      required this.image,
      required this.albumName,
      required this.artistName,
      required this.size,
      required this.isDeletable});
  final String albumName;
  final String artistName;
  final String image;
  final double size;
  final bool isDeletable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: size,
                width: size,
                child: Image.asset('images/home/$image'),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    albumName,
                    style: const TextStyle(
                      fontFamily: "AM",
                      fontSize: 15,
                      color: MyColors.whiteColor,
                    ),
                  ),
                  Text(
                    "Album . $artistName",
                    style: const TextStyle(
                      fontFamily: "AM",
                      fontSize: 13,
                      color: MyColors.lightGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Visibility(
            visible: isDeletable,
            child: Image.asset(
              'images/icon_back.png',
              height: 14,
              width: 14,
            ),
          ),
        ],
      ),
    );
  }
}
