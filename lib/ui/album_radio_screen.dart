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
              _AlbumRadioActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AlbumRadioActionButtons extends StatefulWidget {
  const _AlbumRadioActionButtons();

  @override
  State<_AlbumRadioActionButtons> createState() =>
      _AlbumRadioActionButtonsState();
}

class _AlbumRadioActionButtonsState extends State<_AlbumRadioActionButtons> {
  bool isInPlay = true;
  bool isInShuffle = false;
  bool isInRepeat = true;
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
                    iconWidth: 2.5,
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
    List<String> trackList = [
      "Don't Understand",
      "Somthing Real",
      "Chemical",
      "Novacandy",
      "Mourning",
      "Too Cool To Die",
      "Sign Me Up",
      "Socialite",
      "Overdrive",
      "Speedometer",
      "Hold My Breath",
      "Enough is Enough",
      "Texas Tea",
      "Buyer Beware",
      "Landmine",
      "Green Thumb",
      "Laugh It Off",
    ];
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                trackList[index],
                                style: const TextStyle(
                                  fontFamily: "AM",
                                  fontSize: 15,
                                  color: MyColors.whiteColor,
                                ),
                              ),
                              const Text(
                                "Post Malone",
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
        childCount: trackList.length,
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
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
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
            ),
            const SizedBox(
              width: 208,
              child: Text(
                "Album radio based on AUSTIN - Post Malone",
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
        Row(
          children: [
            SizedBox(
              height: 46,
              width: 46,
              child: Image.asset('images/home/AUSTIN.jpg'),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enough is Enough",
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 13,
                      color: MyColors.greenColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Post Malone",
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 13,
                      color: MyColors.lightGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Next From: AUSTIN/ Texas Tea",
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
