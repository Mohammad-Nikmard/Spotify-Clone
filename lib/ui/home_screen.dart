import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              RecentPlays(),
              Review2024(),
              EditorPicks(),
            ],
          ),
        ),
      ),
    );
  }
}

class EditorPicks extends StatelessWidget {
  const EditorPicks({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Editor's picks",
              style: TextStyle(
                fontFamily: "AM",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: MyColors.whiteColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 153,
                          width: 153,
                          child: ColoredBox(
                            color: MyColors.greenColor,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 143,
                          child: Text(
                            "Ed Shearen, Big Sean, Juice WRLD, Post Malone",
                            style: TextStyle(
                              fontFamily: "AM",
                              fontSize: 11.5,
                              color: MyColors.lightGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Review2024 extends StatelessWidget {
  const Review2024({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 58,
                  width: 58,
                  color: MyColors.greenColor,
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "#SPOTIFYWRAPPED",
                      style: TextStyle(
                        fontFamily: "AM",
                        fontSize: 10,
                        color: MyColors.lightGrey,
                      ),
                    ),
                    Text(
                      "Your 2024 in review",
                      style: TextStyle(
                        fontFamily: "AM",
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: MyColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 153,
                      width: 153,
                      child: ColoredBox(
                        color: MyColors.greenColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your Top Songs 2024",
                      style: TextStyle(
                        color: MyColors.whiteColor,
                        fontSize: 13.5,
                        fontFamily: "AM",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 153,
                      width: 153,
                      child: ColoredBox(
                        color: MyColors.greenColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your Top Songs 2024",
                      style: TextStyle(
                        color: MyColors.whiteColor,
                        fontSize: 13.5,
                        fontFamily: "AM",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RecentPlays extends StatelessWidget {
  const RecentPlays({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recently played",
                  style: TextStyle(
                    fontFamily: "AB",
                    color: MyColors.whiteColor,
                    fontSize: 19,
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('images/icon_bell.png'),
                      Image.asset("images/icon_recent.png"),
                      Image.asset("images/icon_settings.png"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 135,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 20, right: 15),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: MyColors.greenColor,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Drake",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 12,
                            color: MyColors.whiteColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
