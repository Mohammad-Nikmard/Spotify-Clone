import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';

class ArtistChip extends StatelessWidget {
  const ArtistChip(
      {super.key,
      required this.image,
      required this.name,
      required this.radius,
      required this.isDeletable});
  final String image;
  final String name;
  final double radius;
  final bool isDeletable;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: radius,
                  backgroundImage: AssetImage("images/artists/$image"),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontFamily: "AM",
                        fontSize: 15,
                        color: MyColors.whiteColor,
                      ),
                    ),
                    const Text(
                      "Artist",
                      style: TextStyle(
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
      ),
    );
  }
}
