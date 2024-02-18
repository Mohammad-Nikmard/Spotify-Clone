import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/widgets/stream_buttons.dart';

class AlbumViewScreen extends StatelessWidget {
  const AlbumViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff9E2216),
            MyColors.blackColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              const _Header(),
              AlbumControlButtons(),
              SliverPadding(
                padding: const EdgeInsets.only(top: 15, bottom: 25),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Love Me Do - Mono / Remastered",
                                  style: TextStyle(
                                    fontFamily: "AM",
                                    fontSize: 17,
                                    color: MyColors.whiteColor,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/icon_downloaded.png',
                                      height: 13,
                                      width: 13,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      "The Beatles",
                                      style: TextStyle(
                                        fontFamily: "AM",
                                        fontSize: 14,
                                        color: MyColors.lightGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset('images/icon_more.png'),
                          ],
                        ),
                      );
                    },
                    childCount: 10,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AlbumControlButtons extends StatefulWidget {
  const AlbumControlButtons({super.key});

  @override
  State<AlbumControlButtons> createState() => _AlbumControlButtonsState();
}

class _AlbumControlButtonsState extends State<AlbumControlButtons> {
  bool _isLiked = false;
  bool _isInPlay = true;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "1(Remastered)",
                style: TextStyle(
                  fontFamily: "AM",
                  fontSize: 25,
                  color: MyColors.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: MyColors.greenColor,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "The Beatles",
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 14,
                      color: MyColors.whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Album . 2000",
                style: TextStyle(
                  fontFamily: "AM",
                  fontSize: 13,
                  color: MyColors.lightGrey,
                ),
              ),
              SizedBox(
                width: 120,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isLiked = !_isLiked;
                        });
                      },
                      child: (_isLiked)
                          ? Image.asset('images/icon_heart.png')
                          : Image.asset('images/icon_heart_filled.png'),
                    ),
                    Image.asset('images/icon_downloaded.png'),
                    Image.asset('images/icon_more.png'),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isInPlay = !_isInPlay;
              });
            },
            child: (_isInPlay)
                ? const PlayButton(
                    height: 56,
                    width: 56,
                    color: MyColors.greenColor,
                  )
                : const PauseButton(
                    iconHeight: 19,
                    color: MyColors.greenColor,
                    height: 56,
                    width: 56,
                  ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('images/icon_arrow_left.png'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'images/song_screen_big.png',
              height: 234,
              width: 234,
            ),
          ],
        ),
      ),
    );
  }
}
