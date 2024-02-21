import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/ui/profile_screen.dart';
import 'package:spotify_clone/widgets/bottom_player.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      appBar: AppBar(
        backgroundColor: const Color(0xff191919),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 65,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontFamily: "AB",
            fontSize: 16,
            color: MyColors.whiteColor,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset("images/icon_arrow_left.png"),
        ),
      ),
      body: const Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              slivers: [
                ProfileChip(),
                SettingsChip(title: "Account"),
                SettingsChip(title: "Data Saver"),
                SettingsChip(title: "Langugages"),
                SettingsChip(title: "Playback"),
                SettingsChip(title: "Explicit Content"),
                SettingsChip(title: "Devices"),
                SettingsChip(title: "Car"),
                SettingsChip(title: "Social"),
                SettingsChip(title: "Voice Assistant & Apps"),
                SettingsChip(title: "Audio Quality"),
                SettingsChip(title: "Storage"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 64),
            child: BottomPlayer(),
          ),
        ],
      ),
    );
  }
}

class SettingsChip extends StatelessWidget {
  const SettingsChip({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: "AM",
                fontSize: 16,
                color: MyColors.whiteColor,
              ),
            ),
            Image.asset("images/icon_arrow_right.png"),
          ],
        ),
      ),
    );
  }
}

class ProfileChip extends StatelessWidget {
  const ProfileChip({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 45),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage("images/myImage.png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Mohammad",
                          style: TextStyle(
                            fontFamily: "AB",
                            fontSize: 18,
                            color: MyColors.whiteColor,
                          ),
                        ),
                        Text(
                          "View Profile",
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
              ),
              Image.asset("images/icon_arrow_right.png"),
            ],
          ),
        ),
      ),
    );
  }
}
