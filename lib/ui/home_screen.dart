import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/ui/setting_screen.dart';
import 'package:spotify_clone/widgets/bottom_player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CustomScrollView(
                slivers: [
                  _Header(),
                  JumpBackin(),
                  TopMixes(),
                  EditorPicks(),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 50),
                  ),
                ],
              ),
            ),
            BottomPlayer(),
          ],
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
              "Recently played",
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
              height: 199,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 133,
                        width: 133,
                        child: Image.asset("images/home/Upbeat-Mix.jpg"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Upbeat Mix",
                        style: TextStyle(
                          fontFamily: "AB",
                          fontSize: 12,
                          color: MyColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 133,
                        width: 133,
                        child: Image.asset("images/home/Daily-Mix-1.jpg"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Daily Mix 1",
                        style: TextStyle(
                          fontFamily: "AB",
                          fontSize: 12,
                          color: MyColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 133,
                        width: 133,
                        child: Image.asset("images/home/UTOPIA.jpg"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "UTOPIA",
                        style: TextStyle(
                          fontFamily: "AB",
                          fontSize: 12,
                          color: MyColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 133,
                        width: 133,
                        child: Image.asset("images/home/american-dream.jpg"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "american dream",
                        style: TextStyle(
                          fontFamily: "AB",
                          fontSize: 12,
                          color: MyColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Column(
                    children: [
                      CircleAvatar(
                        radius: 65,
                        backgroundImage: AssetImage("images/artists/JID.jpg"),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Center(
                        child: Text(
                          "JID",
                          style: TextStyle(
                            fontFamily: "AB",
                            fontSize: 12,
                            color: MyColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JumpBackin extends StatelessWidget {
  const JumpBackin({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Jump back in",
              style: TextStyle(
                fontFamily: "AB",
                color: MyColors.whiteColor,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 199,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 153,
                        width: 153,
                        child: Image.asset("images/home/Rap-Workout.jpg"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        width: 150,
                        child: Text(
                          "Future, Jack Harllow, Drake and more",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 12.5,
                            color: MyColors.lightGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 153,
                          width: 153,
                          child: Image.asset("images/home/Drake-Mix.jpg")),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        width: 150,
                        child: Text(
                          "JID, Baby Keem and 21 Savage",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 12.5,
                            color: MyColors.lightGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Column(
                    children: [
                      CircleAvatar(
                        radius: 75,
                        backgroundImage:
                            AssetImage("images/artists/Kendrick-Lamar.jpg"),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Kendrick Lamar",
                        style: TextStyle(
                          fontFamily: "AB",
                          fontSize: 12,
                          color: MyColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 153,
                        width: 153,
                        child: Image.asset("images/home/UTOPIA.jpg"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "UTOPIA",
                            style: TextStyle(
                              fontFamily: "AB",
                              fontSize: 12,
                              color: MyColors.whiteColor,
                            ),
                          ),
                          Text(
                            "Album . Travis Scott",
                            style: TextStyle(
                              fontFamily: "AM",
                              fontSize: 12.5,
                              color: MyColors.lightGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 153,
                        width: 153,
                        child: Image.asset("images/home/For-All-The-Dogs.jpg"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "For All The Dogs",
                            style: TextStyle(
                              fontFamily: "AB",
                              fontSize: 12,
                              color: MyColors.whiteColor,
                            ),
                          ),
                          Text(
                            "Album . Drake",
                            style: TextStyle(
                              fontFamily: "AM",
                              fontSize: 12.5,
                              color: MyColors.lightGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopMixes extends StatelessWidget {
  const TopMixes({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your top mixes",
              style: TextStyle(
                fontFamily: "AB",
                color: MyColors.whiteColor,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 199,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 153,
                        width: 153,
                        child: Image.asset("images/home/2010s-mix.png"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        width: 150,
                        child: Text(
                          "Travis Scott, Soul Chef, Kanye West and more",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 12.5,
                            color: MyColors.lightGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 153,
                        width: 153,
                        child: Image.asset("images/home/chill-mix.png"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        width: 150,
                        child: Text(
                          "Talyor Swift, The Beatles and more",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 12.5,
                            color: MyColors.lightGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 153,
                        width: 153,
                        child: Image.asset("images/home/Upbeat-Mix.jpg"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        width: 150,
                        child: Text(
                          "benny blanco, Darke and more",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 12.5,
                            color: MyColors.lightGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 153,
                        width: 153,
                        child: Image.asset("images/home/Offset-Mix.jpg"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        width: 150,
                        child: Text(
                          "Baby keem, Travis Scott and Drake",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 12.5,
                            color: MyColors.lightGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 153,
                        width: 153,
                        child: Image.asset("images/home/Drake-Mix.jpg"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        width: 150,
                        child: Text(
                          "JID, Baby Keem and 21 Savage",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 12.5,
                            color: MyColors.lightGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("images/myImage.png"),
                    ),
                    SizedBox(width: 12),
                    Text(
                      "Good evening",
                      style: TextStyle(
                        fontFamily: "AB",
                        color: MyColors.whiteColor,
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('images/icon_bell.png'),
                      Image.asset("images/icon_recent.png"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingScreen(),
                            ),
                          );
                        },
                        child: Image.asset("images/icon_settings.png"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 35,
                  decoration: const BoxDecoration(
                    color: MyColors.darGreyColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(145),
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Music",
                        style: TextStyle(
                          fontFamily: "AM",
                          fontSize: 14,
                          color: MyColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 35,
                  decoration: const BoxDecoration(
                    color: MyColors.darGreyColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(145),
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Podcasts",
                        style: TextStyle(
                          fontFamily: "AM",
                          fontSize: 14,
                          color: MyColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: (MediaQuery.of(context).size.width / 1.77) - 45,
                      decoration: const BoxDecoration(
                        color: MyColors.darGreyColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "images/liked_songs.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Image.asset(
                                'images/icon_heart_filled.png',
                                height: 20,
                                width: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Liked Songs",
                            style: TextStyle(
                              fontFamily: "AB",
                              fontSize: 12,
                              color: MyColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const _RecentPlaysChip(
                      image: "artists/JID.jpg",
                      title: "JID",
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _RecentPlaysChip(
                      image: "home/american-dream.jpg",
                      title: "american dream",
                    ),
                    _RecentPlaysChip(
                      image: "home/UTOPIA.jpg",
                      title: "UTOPIA",
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _RecentPlaysChip(
                      image: "home/Upbeat-Mix.jpg",
                      title: "Upbeat Mix",
                    ),
                    _RecentPlaysChip(
                      image: "home/Daily-Mix-1.jpg",
                      title: "Daily Mix",
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

class _RecentPlaysChip extends StatelessWidget {
  const _RecentPlaysChip({required this.image, required this.title});
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: (MediaQuery.of(context).size.width / 1.77) - 45,
      decoration: const BoxDecoration(
        color: MyColors.darGreyColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              image: DecorationImage(
                image: AssetImage(
                  "images/$image",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontFamily: "AB",
              fontSize: 12,
              color: MyColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
