import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';

class ShareSongScreen extends StatelessWidget {
  const ShareSongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0,
                  color: MyColors.blackColor,
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff50221E),
                    Color(0xff9E2216),
                    MyColors.blackColor,
                  ],
                ),
              ),
              child: const SongInfo(),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.blackColor,
                border: Border.all(
                  width: 0,
                  color: MyColors.blackColor,
                ),
              ),
              child: Image.asset("images/social_links.png"),
            ),
          ),
        ],
      ),
    );
  }
}

class SongInfo extends StatelessWidget {
  const SongInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("images/icon_back.png", height: 15, width: 15),
              const Text(
                "Share",
                style: TextStyle(
                  fontFamily: "AM",
                  fontSize: 18,
                  color: MyColors.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 15,
                width: 15,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 90,
        ),
        Image.asset(
          "images/song_screen.png",
          height: 220,
          width: 220,
        ),
        const SizedBox(
          height: 25,
        ),
        const Center(
          child: SizedBox(
            width: 235,
            child: Text(
              "From Me to You - Mono / Remastered",
              style: TextStyle(
                fontFamily: "AM",
                color: MyColors.whiteColor,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Center(
          child: Text(
            "The Beatles",
            style: TextStyle(
              fontFamily: "AM",
              fontSize: 16,
              color: MyColors.lightGrey,
            ),
          ),
        ),
      ],
    );
  }
}
