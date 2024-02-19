import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';

class SongChip extends StatelessWidget {
  const SongChip(
      {super.key,
      required this.image,
      required this.singerName,
      required this.songTitle,
      required this.size,
      required this.isDeletable});
  final String songTitle;
  final String singerName;
  final String image;
  final double size;
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
                      songTitle,
                      style: const TextStyle(
                        fontFamily: "AM",
                        fontSize: 15,
                        color: MyColors.whiteColor,
                      ),
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 13,
                              width: 13,
                              decoration: const BoxDecoration(
                                color: Color(0xffC4C4C4),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3),
                                ),
                              ),
                            ),
                            const Text(
                              "E",
                              style: TextStyle(
                                fontSize: 8,
                                color: MyColors.blackColor,
                                fontFamily: "AM",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Song . $singerName",
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
