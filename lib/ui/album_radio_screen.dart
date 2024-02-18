import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/widgets/stream_buttons.dart';

class AlbumRadioScreen extends StatelessWidget {
  const AlbumRadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff1B1A1C),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              _Header(),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    _TrackList(),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AlbumRadioActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class AlbumRadioActionButtons extends StatefulWidget {
  const AlbumRadioActionButtons({super.key});

  @override
  State<AlbumRadioActionButtons> createState() =>
      _AlbumRadioActionButtonsState();
}

class _AlbumRadioActionButtonsState extends State<AlbumRadioActionButtons> {
  bool isInPlay = false;
  bool isInShuffle = false;
  bool isInRepeat = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 55, right: 55, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isInShuffle = !isInShuffle;
              });
            },
            child: (isInShuffle)
                ? Image.asset(
                    'images/icon_shuffle_on.png',
                    height: 22,
                    width: 22,
                  )
                : Image.asset(
                    'images/icon_shuffle_off.png',
                    height: 22,
                    width: 22,
                  ),
          ),
          Image.asset('images/icon_back_song.png'),
          GestureDetector(
            onTap: () {
              setState(() {
                isInPlay = !isInPlay;
              });
            },
            child: (isInPlay)
                ? const PlayButton(
                    color: MyColors.whiteColor, height: 59, width: 59)
                : const PauseButton(
                    color: MyColors.whiteColor,
                    height: 59,
                    width: 59,
                    iconHeight: 20,
                  ),
          ),
          Image.asset('images/icon_next_song.png'),
          GestureDetector(
            onTap: () {
              setState(() {
                isInRepeat = !isInRepeat;
              });
            },
            child: (isInRepeat)
                ? Image.asset(
                    'images/icon_repeat_on.png',
                    height: 29,
                    width: 29,
                  )
                : Image.asset(
                    'images/icon_restart_off.png',
                    height: 29,
                    width: 29,
                  ),
          ),
        ],
      ),
    );
  }
}

class _TrackList extends StatelessWidget {
  const _TrackList();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.1,
                            child: Checkbox(
                              side: const BorderSide(
                                width: 1,
                                color: MyColors.whiteColor,
                              ),
                              shape: const CircleBorder(),
                              activeColor: MyColors.greenColor,
                              checkColor: MyColors.whiteColor,
                              value: false,
                              onChanged: (onChanged) {},
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Troubled Paradise",
                                style: TextStyle(
                                  fontFamily: "AM",
                                  fontSize: 15,
                                  color: MyColors.whiteColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Slayyter",
                                  style: TextStyle(
                                    fontFamily: "AM",
                                    fontSize: 13,
                                    color: MyColors.lightGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.asset(
                        'images/icon_move.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        childCount: 10,
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.blackColor,
              ),
              child: Center(
                child: Image.asset(
                  "images/icon_back.png",
                  height: 16,
                  width: 16,
                ),
              ),
            ),
            const SizedBox(
              width: 208,
              child: Text(
                "Album radio based on From Me to You - Mono/Remastered",
                style: TextStyle(
                  fontFamily: "AM",
                  fontSize: 14,
                  color: MyColors.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
              width: 30,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Now Playing",
          style: TextStyle(
            fontFamily: "AB",
            fontSize: 15,
            color: MyColors.whiteColor,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Row(
          children: [
            SizedBox(
              height: 46,
              width: 46,
              child: ColoredBox(
                color: MyColors.greenColor,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From Me to You - Mono/Remastered",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 13,
                    color: MyColors.greenColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Washed Out",
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
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Next From: From Me to You - Mono/Remastered",
          style: TextStyle(
            fontFamily: "AB",
            fontSize: 15,
            color: MyColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
