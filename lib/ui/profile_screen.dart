import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/widgets/bottom_player.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff101010),
                      width: 0,
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff00667B),
                        Color(0xff002F38),
                        Color(0xff101010),
                      ],
                    ),
                  ),
                  child: const _ProfileHeader(),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff101010),
                      width: 0,
                    ),
                    color: const Color(0xff101010),
                  ),
                  child: const _ProfilePlaylists(),
                ),
              ),
            ],
          ),
          const BottomPlayer(),
        ],
      ),
    );
  }
}

class _ProfilePlaylists extends StatelessWidget {
  const _ProfilePlaylists();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 10,
        ),
        Image.asset("images/shazam_playlist.png"),
        const SizedBox(
          height: 5,
        ),
        Image.asset("images/roadtrip_playlist.png"),
        const SizedBox(
          height: 5,
        ),
        Image.asset("images/study_playlist.png"),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "See all playlists",
                style: TextStyle(
                  fontFamily: "AM",
                  fontSize: 15,
                  color: MyColors.whiteColor,
                ),
              ),
              Image.asset("images/icon_arrow_right.png"),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
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
                child: Image.asset("images/icon_arrow_left.png"),
              ),
              Image.asset(
                "images/icon_more.png",
                color: MyColors.whiteColor,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage("images/myImage.png"),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  height: 31,
                  width: 105,
                  decoration: BoxDecoration(
                    color: const Color(0xff3E3F3F),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontFamily: "AB",
                        color: MyColors.whiteColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '23',
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 12,
                            color: MyColors.whiteColor,
                          ),
                        ),
                        Text(
                          "PlayLists",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 12,
                            color: MyColors.lightGrey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '58',
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 12,
                            color: MyColors.whiteColor,
                          ),
                        ),
                        Text(
                          "Followers",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 10,
                            color: MyColors.lightGrey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '43',
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 12,
                            color: MyColors.whiteColor,
                          ),
                        ),
                        Text(
                          "Following",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 10,
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
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Playlists",
              style: TextStyle(
                fontFamily: "AM",
                fontWeight: FontWeight.w400,
                color: MyColors.whiteColor,
                fontSize: 19,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
