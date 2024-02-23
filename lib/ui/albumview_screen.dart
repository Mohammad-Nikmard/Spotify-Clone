import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/bloc/album/album_bloc.dart';
import 'package:spotify_clone/bloc/album/album_state.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/data/model/album.dart';
import 'package:spotify_clone/data/model/album_track.dart';
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
  ScrollController? _scrollController;
  double imageSize = 0;
  double initSize = 236;
  double containerHeight = 465;
  double containerInitialHeight = 465;
  double imageOpacity = 1;
  bool showTopBar = false;
  bool _isInPlay = false;
  @override
  void initState() {
    imageSize = initSize;

    _scrollController = ScrollController()
      ..addListener(() {
        imageSize = initSize - _scrollController!.offset;
        if (imageSize < 0) {
          imageSize = 0;
        }
        containerHeight = containerInitialHeight - _scrollController!.offset;
        if (containerHeight < 0) {
          containerHeight = 0;
        }
        imageOpacity = imageSize / initSize;
        if (_scrollController!.offset > 224) {
          showTopBar = true;
        } else {
          showTopBar = false;
        }
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumListResponseState) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Stack(
                    children: [
                      Container(
                        color: state.album.colorPallete[0],
                        height: containerHeight,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Opacity(
                                opacity: imageOpacity.clamp(0, 1.0),
                                child: Container(
                                  height: imageSize,
                                  width: imageSize,
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
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    MyColors.blackColor.withOpacity(0),
                                    MyColors.blackColor.withOpacity(0.1),
                                    MyColors.blackColor.withOpacity(1),
                                  ],
                                ),
                                border: Border.all(
                                  width: 0,
                                  color: state.album.colorPallete[1],
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 20),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: initSize + 45,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 25),
                                      child: _AlbumControlButtons(
                                        album: state.album,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              // height: 1000,
                              decoration: BoxDecoration(
                                color: MyColors.blackColor,
                                border: Border.all(
                                  width: 0,
                                  color: MyColors.blackColor,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  for (var element
                                      in state.album.trackList) ...{
                                    _AlbumTrackList(
                                      track: element,
                                      album: state.album,
                                    ),
                                  }
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          height: 90,
                          color: showTopBar
                              ? state.album.colorPallete[0]
                              : Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: AlignmentDirectional.centerStart,
                                  children: [
                                    Positioned(
                                      left: 15,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Icon(
                                          Icons.arrow_back_rounded,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        opacity: showTopBar ? 1 : 0,
                                        child: Text(
                                          state.album.albumName,
                                          style: const TextStyle(
                                            fontFamily: "AM",
                                            fontSize: 16,
                                            color: MyColors.whiteColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 25,
                                      bottom: 85 -
                                          containerHeight.clamp(
                                              125.0, double.infinity),
                                      child: (!_isInPlay)
                                          ? const PlayButton(
                                              height: 56,
                                              width: 56,
                                              color: MyColors.greenColor,
                                            )
                                          : const PauseButton(
                                              iconWidth: 3,
                                              iconHeight: 19,
                                              color: MyColors.greenColor,
                                              height: 56,
                                              width: 56,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
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
  const _AlbumTrackList({required this.track, required this.album});
  final AlbumTrack track;
  final Album album;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 110,
                child: Text(
                  track.trackName,
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
                    track.singers,
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
                  builder: (context) => SongControlScreen(
                    trackName: track.trackName,
                    albumImage: album.albumImage,
                    singer: track.singers,
                    color: album.colorPallete[0],
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _AlbumControlButtons extends StatefulWidget {
  const _AlbumControlButtons({required this.album});
  final Album album;

  @override
  State<_AlbumControlButtons> createState() => _AlbumControlButtonsState();
}

class _AlbumControlButtonsState extends State<_AlbumControlButtons> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  backgroundImage:
                      AssetImage('images/artists/${widget.album.artistImage}'),
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
                        : Image.asset(
                            'images/icon_heart_filled.png',
                            height: 22,
                            width: 20,
                          ),
                  ),
                  Image.asset('images/icon_downloaded.png'),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlbumControlScreen(
                            album: widget.album,
                          ),
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
      ],
    );
  }
}
