import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/bloc/album/album_bloc.dart';
import 'package:spotify_clone/bloc/album/album_state.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/ui/album_control_screen.dart';
import 'package:spotify_clone/ui/song_control_screen.dart';
import 'package:spotify_clone/widgets/bottom_player.dart';
import 'package:spotify_clone/widgets/stream_buttons.dart';

class AlbumViewScreen extends StatelessWidget {
  const AlbumViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumListResponseState) {
            return SafeArea(
              top: false,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        floating: true,
                        pinned: false,
                        toolbarHeight: 30,
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(381),
                          child: SizedBox(
                            height: 381,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        Icons.arrow_back_rounded,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      SizedBox(
                                        height: 236,
                                        width: 236,
                                        child: Image.asset(
                                            'images/home/AUSTIN.jpg'),
                                      ),
                                      const SizedBox(
                                        height: 24,
                                        width: 24,
                                      ),
                                    ],
                                  ),
                                ),
                                const AlbumControlButtons(),
                              ],
                            ),
                          ),
                        ),
                        automaticallyImplyLeading: false,
                        scrolledUnderElevation: 0,
                        expandedHeight: 370,
                        flexibleSpace: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0, color: MyColors.blackColor),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.blue[400]!, MyColors.blackColor],
                            ),
                          ),
                        ),
                      ),
                      SliverPersistentHeader(
                        delegate: SliverHeader(),
                        pinned: true,
                        floating: true,
                      ),
                      const _AlbumTrackList(),
                    ],
                  ),
                  const BottomPlayer(),
                ],
              ),
            );
          }
          return Text("");
        },
      ),
    );
  }
}

class _AlbumTrackList extends StatelessWidget {
  const _AlbumTrackList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 15, bottom: 25, right: 20, left: 20),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SongControlScreen(),
                        ),
                      );
                    },
                    child: Image.asset('images/icon_more.png'),
                  ),
                ],
              ),
            );
          },
          childCount: 30,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "AUSTIN",
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
                    backgroundImage:
                        AssetImage('images/artists/Post-Malone.jpg'),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Post Malone",
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
                "Album . 2023",
                style: TextStyle(
                  fontFamily: "AM",
                  fontSize: 13,
                  color: Color.fromARGB(255, 165, 165, 165),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AlbumControlScreen(),
                          ),
                        );
                      },
                      child: Image.asset('images/icon_more.png'),
                    ),
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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    color: MyColors.whiteColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'images/home/AUSTIN.jpg',
              height: 234,
              width: 234,
            ),
          ],
        ),
      ),
    );
  }
}

class SliverHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 90,
      color: Colors.blue,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              Icon(
                Icons.arrow_back_rounded,
                color: MyColors.whiteColor,
              ),
              SizedBox(width: 30),
              Text(
                "AUSTIN",
                style: TextStyle(
                  fontFamily: "AB",
                  fontSize: 16,
                  color: MyColors.whiteColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
