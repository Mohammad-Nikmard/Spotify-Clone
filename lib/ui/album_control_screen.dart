import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/data/model/album.dart';
import 'package:spotify_clone/ui/share_song_screen.dart';

class AlbumControlScreen extends StatelessWidget {
  const AlbumControlScreen({super.key, required this.album});
  final Album album;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 390,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0,
                  color: MyColors.blackColor,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    album.colorPallete[0],
                    MyColors.blackColor,
                  ],
                ),
              ),
              child: _Header(
                album: album,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0,
                  color: MyColors.blackColor,
                ),
                color: MyColors.blackColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const _AlbumChip(text: "Like", image: "icon_heart.png"),
                    const _AlbumChip(
                        text: "View artist", image: "icon_view_artist.png"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShareSongScreen(),
                          ),
                        );
                      },
                      child: const _AlbumChip(
                          text: "Share", image: "icon_share.png"),
                    ),
                    const _AlbumChip(
                        text: "Like all songs", image: "icon_heart.png"),
                    const _AlbumChip(
                        text: "Add to playlist",
                        image: "icon_add_to_playlist.png"),
                    const _AlbumChip(
                        text: "Add to queue", image: "icon_add_to_quoue.png"),
                    const _AlbumChip(
                        text: "Go to radio", image: "icon_radio.png"),
                    const SizedBox(height: 35),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Close",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 16,
                            color: MyColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AlbumChip extends StatelessWidget {
  const _AlbumChip({required this.text, required this.image});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("images/$image"),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontFamily: "AM",
              fontSize: 16,
              color: MyColors.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.album});
  final Album album;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 55,
        ),
        Image.asset(
          "images/home/${album.albumImage}",
          height: 164,
          width: 164,
        ),
        const SizedBox(
          height: 66,
        ),
        Center(
          child: Text(
            album.albumName,
            style: const TextStyle(
              fontFamily: "AM",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: MyColors.whiteColor,
            ),
          ),
        ),
        Center(
          child: Text(
            album.singerName,
            style: const TextStyle(
              fontFamily: "AM",
              fontSize: 14,
              color: MyColors.lightGrey,
            ),
          ),
        ),
      ],
    );
  }
}
