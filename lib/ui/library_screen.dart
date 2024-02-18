import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/ui/profile_screen.dart';
import 'package:spotify_clone/ui/setting_screen.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingScreen(),
                            ),
                          );
                        },
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: MyColors.greenColor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Your Library",
                              style: TextStyle(
                                fontFamily: "AB",
                                fontSize: 24,
                                color: MyColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          );
                        },
                        child: Image.asset("images/icon_add.png"),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: OptionsList(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "images/arrow_component_down.png",
                              ),
                              Image.asset(
                                "images/arrow_component_up.png",
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Recently Played",
                            style: TextStyle(
                              fontFamily: "AM",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: MyColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      Image.asset("images/icon_category.png"),
                    ],
                  ),
                ),
              ),
              const LikedSongs(),
              const NewEpisodes(),
            ],
          ),
        ),
      ),
    );
  }
}

class NewEpisodes extends StatelessWidget {
  const NewEpisodes({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset("images/new_episods.png"),
                Image.asset("images/icon_bell_fill.png"),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Liked Songs",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 15,
                    color: MyColors.whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Image.asset("images/icon_pin.png"),
                    const SizedBox(width: 5),
                    const Text(
                      "Updated 2 days ago",
                      style: TextStyle(
                        fontFamily: "AM",
                        color: MyColors.lightGrey,
                        fontSize: 13,
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

class LikedSongs extends StatelessWidget {
  const LikedSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset("images/liked_songs.png"),
                Image.asset("images/icon_heart_filled.png"),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Liked Songs",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 15,
                    color: MyColors.whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Image.asset("images/icon_pin.png"),
                    const SizedBox(width: 5),
                    const Text(
                      "Playlist . 58 songs",
                      style: TextStyle(
                        fontFamily: "AM",
                        color: MyColors.lightGrey,
                        fontSize: 13,
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

class LibraryOptionsChip extends StatelessWidget {
  const LibraryOptionsChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Container(
            height: 33,
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.lightGrey,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Playlists",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 12,
                    color: MyColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionsList extends StatelessWidget {
  const OptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const LibraryOptionsChip();
        },
      ),
    );
  }
}
