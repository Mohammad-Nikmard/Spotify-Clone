import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/bloc/album/album_bloc.dart';
import 'package:spotify_clone/bloc/album/album_state.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/data/model/album.dart';
import 'package:spotify_clone/ui/album_control_screen.dart';
import 'package:spotify_clone/ui/song_control_screen.dart';
import 'package:spotify_clone/widgets/bottom_player.dart';
import 'package:spotify_clone/widgets/stream_buttons.dart';

class AlbumViewScreen extends StatefulWidget {
  const AlbumViewScreen({super.key});

  @override
  State<AlbumViewScreen> createState() => _AlbumViewScreenState();
}

class _AlbumViewScreenState extends State<AlbumViewScreen> {
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
                      SliverPersistentHeader(
                        delegate: SliverHeader(state: state),
                        pinned: true,
                        floating: true,
                      ),
                      SliverToBoxAdapter(
                        child: AlbumControlButtons(
                          album: state.album,
                        ),
                      ),
                      _AlbumTrackList(albumList: state.album),
                    ],
                  ),
                  const BottomPlayer(),
                ],
              ),
            );
          }
          return const Center(
            child: Text(
              "Snap! Error Happened",
              style: TextStyle(
                fontFamily: "AB",
                fontSize: 18,
                color: MyColors.whiteColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AlbumTrackList extends StatelessWidget {
  const _AlbumTrackList({required this.albumList});
  final Album albumList;

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
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 110,
                        child: Text(
                          albumList.trackList[index].trackName,
                          style: const TextStyle(
                            fontFamily: "AM",
                            fontSize: 16,
                            color: MyColors.whiteColor,
                          ),
                          overflow: TextOverflow.ellipsis,
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
                          Text(
                            albumList.trackList[index].singers,
                            style: const TextStyle(
                              fontFamily: "AM",
                              fontSize: 13,
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
          childCount: albumList.trackList.length,
        ),
      ),
    );
  }
}

class AlbumControlButtons extends StatefulWidget {
  const AlbumControlButtons({super.key, required this.album});
  final Album album;

  @override
  State<AlbumControlButtons> createState() => _AlbumControlButtonsState();
}

class _AlbumControlButtonsState extends State<AlbumControlButtons> {
  bool _isLiked = false;
  bool _isInPlay = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            widget.album.colorPallete[1],
            MyColors.blackColor,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.album.albumName,
                  style: const TextStyle(
                    fontFamily: "AM",
                    fontSize: 25,
                    color: MyColors.whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(
                          'images/artists/${widget.album.artistImage}'),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.album.singerName,
                      style: const TextStyle(
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
                Text(
                  "Album . ${widget.album.year}",
                  style: const TextStyle(
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
      ),
    );
  }
}

class SliverHeader extends SliverPersistentHeaderDelegate {
  final AlbumListResponseState state;

  SliverHeader({required this.state});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double value = 285 - shrinkOffset;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: (shrinkOffset > 190)
          ? Container(
              key: const Key("1"),
              height: 90,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    state.album.colorPallete[0],
                    state.album.colorPallete[1],
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        state.album.albumName,
                        style: const TextStyle(
                          fontFamily: "AM",
                          fontSize: 16,
                          color: MyColors.whiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          : Container(
              key: const Key("2"),
              height: value + 15,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    state.album.colorPallete[0],
                    state.album.colorPallete[1],
                  ],
                ),
                border: Border.all(
                  width: 0,
                  color: state.album.colorPallete[1],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: AnimatedScale(
                                duration: const Duration(milliseconds: 200),
                                scale: (value < 100) ? 0 : 1,
                                child: const Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                            AnimatedScale(
                              duration: const Duration(milliseconds: 200),
                              scale: (value < 130) ? 0 : 1,
                              child: Container(
                                height: calScale(value),
                                width: calScale(value),
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: MyColors.blackColor,
                                      offset: Offset(0, 10),
                                      spreadRadius: -10,
                                      blurRadius: 15,
                                    ),
                                    BoxShadow(
                                      color: MyColors.blackColor,
                                      offset: Offset(0, -10),
                                      spreadRadius: -10,
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  'images/home/${state.album.albumImage}',
                                ),
                              ),
                            ),
                            AnimatedScale(
                              duration: const Duration(milliseconds: 200),
                              scale: (value < 100) ? 0 : 1,
                              child: const Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.transparent,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  double calScale(value) {
    if (value > 0) {
      return value - 35;
    } else {
      return 0;
    }
  }

  @override
  double get maxExtent => 300.0;

  @override
  double get minExtent => 300.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
