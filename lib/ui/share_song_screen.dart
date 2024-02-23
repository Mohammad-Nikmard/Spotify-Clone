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
                    Colors.blue,
                    MyColors.blackColor,
                  ],
                ),
              ),
              child: const _SongInfo(),
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

class _SongInfo extends StatelessWidget {
  const _SongInfo({super.key});

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
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child:
                    Image.asset("images/icon_back.png", height: 15, width: 15),
              ),
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
          height: 60,
        ),
        Image.asset(
          "images/home/AUSTIN.jpg",
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
              "Enough is Enough",
              style: TextStyle(
                fontFamily: "AM",
                color: MyColors.whiteColor,
                fontSize: 25,
                fontWeight: FontWeight.w700,
                height: 1,
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
            "Post Malone",
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
