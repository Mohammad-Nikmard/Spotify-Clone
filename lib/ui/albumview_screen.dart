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
                        delegate: SliverHeader(
                            title: state.album.albumName, state: state),
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
          return Text("");
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
                            fontSize: 17,
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
            Colors.blue[400]!,
            MyColors.blackColor,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
  final String title;
  final AlbumListResponseState state;

  SliverHeader({required this.title, required this.state});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double value = shrinkOffset / 1.2;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      // height: shrinkOffset / 1,
      decoration: BoxDecoration(
        color: Colors.blue[400],
        border: Border.all(width: 0, color: Colors.blue),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            // height: shrinkOffset / 1.23,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: (value < 130) ? 0 : 1,
                        child: SizedBox(
                          height: value,
                          width: value,
                          child: Image.asset(
                            'images/home/${state.album.albumImage}',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 270.0;

  @override
  double get minExtent => 270.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
