import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/widgets/stream_buttons.dart';

class PlaylistSearchScreen extends StatelessWidget {
  const PlaylistSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff806C53),
            Colors.black,
          ],
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: CustomScrollView(
              slivers: [
                _Header(),
                PlaylistActionButtons(),
                _SongList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SongList extends StatelessWidget {
  const _SongList();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 20, bottom: 35),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    SizedBox(
                      height: 48,
                      width: 48,
                      child: ColoredBox(
                        color: MyColors.greenColor,
                      ),
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Easy",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 16,
                            color: MyColors.whiteColor,
                          ),
                        ),
                        Text(
                          "Troye Silvan",
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
                Image.asset("images/icon_more.png"),
              ],
            ),
          );
        }, childCount: 10),
      ),
    );
  }
}

class PlaylistActionButtons extends StatefulWidget {
  const PlaylistActionButtons({super.key});

  @override
  State<PlaylistActionButtons> createState() => _PlaylistActionButtonsState();
}

class _PlaylistActionButtonsState extends State<PlaylistActionButtons> {
  bool _isInPlay = false;
  bool _isDownloaded = false;
  bool _isLiked = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "New and approved indie pop. CoverL No Rome",
                style: TextStyle(
                  fontFamily: "AM",
                  fontSize: 13,
                  color: MyColors.lightGrey,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Image.asset('images/icon_spotify.png'),
                  const SizedBox(width: 5),
                  const Text(
                    "Spotify",
                    style: TextStyle(
                      fontFamily: "AM",
                      fontWeight: FontWeight.w700,
                      color: MyColors.whiteColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "1629592 likes . 6h 48m",
                style: TextStyle(
                  fontFamily: "AM",
                  fontSize: 13,
                  color: MyColors.lightGrey,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 130,
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
                          ? Image.asset(
                              'images/icon_heart_filled.png',
                              height: 19,
                              width: 20,
                            )
                          : Image.asset('images/icon_heart.png'),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isDownloaded = !_isDownloaded;
                        });
                      },
                      child: (_isDownloaded)
                          ? Image.asset('images/icon_downloaded.png')
                          : Image.asset('images/icon_download.png'),
                    ),
                    Image.asset('images/icon_more.png'),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isInPlay = !_isInPlay;
                });
              },
              child: (_isInPlay)
                  ? const PlayButton(
                      color: MyColors.greenColor,
                      height: 56,
                      width: 56,
                    )
                  : const PauseButton(
                      iconHeight: 19,
                      color: MyColors.greenColor,
                      height: 56,
                      width: 56,
                    ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('images/icon_arrow_left.png'),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _SearchBox(),
              Container(
                height: 38,
                width: 64,
                decoration: BoxDecoration(
                  color: MyColors.whiteColor.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Sort",
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 14,
                      color: MyColors.whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Image.asset('images/indie_pop.png'),
          ),
        ],
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 38,
            width: MediaQuery.of(context).size.width - 105,
            decoration: BoxDecoration(
              color: MyColors.whiteColor.withOpacity(0.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Image.asset(
                    "images/icon_search_transparent.png",
                    color: MyColors.whiteColor,
                  ),
                  const Expanded(
                    child: TextField(
                      style: TextStyle(
                        fontFamily: "AM",
                        fontSize: 16,
                        color: MyColors.whiteColor,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10, left: 15),
                        hintText: "Find in playlist",
                        hintStyle: TextStyle(
                          fontFamily: "AM",
                          color: MyColors.whiteColor,
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                            width: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
