import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/ui/listening_on_screen.dart';
import 'package:spotify_clone/ui/lyrics_section.dart';
import 'package:spotify_clone/ui/song_control_screen.dart';
import 'package:spotify_clone/widgets/stream_buttons.dart';
import 'package:spotify_clone/widgets/video_player.dart';

class TrackViewScreen extends StatefulWidget {
  const TrackViewScreen({super.key});

  @override
  State<TrackViewScreen> createState() => _TrackViewScreenState();
}

class _TrackViewScreenState extends State<TrackViewScreen> {
  bool isOnPlaying = true;
  bool isSwitchedToNextTab = false;
  bool shadowSwitcher = false;
  double _currentNumber = 25;
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                switchInCurve: Curves.decelerate,
                switchOutCurve: Curves.decelerate,
                child: (isSwitchedToNextTab)
                    ? const LyricsSection(
                        key: Key("1"),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            shadowSwitcher = !shadowSwitcher;
                          });
                        },
                        child: Stack(
                          children: [
                            const BackVideoPlayer(
                              key: Key("2"),
                            ),
                            Container(
                              color: (!shadowSwitcher)
                                  ? MyColors.blackColor.withOpacity(0.45)
                                  : Colors.transparent,
                            ),
                            Positioned(
                              left: 25,
                              bottom: 70,
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 200),
                                opacity: (shadowSwitcher) ? 1 : 0,
                                child: const Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundImage: AssetImage(
                                          'images/artists/Post-Malone.jpg'),
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      "by Post Malone",
                                      style: TextStyle(
                                        fontFamily: "AM",
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              const _Header(),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                top: (isSwitchedToNextTab)
                    ? (MediaQuery.of(context).size.height * 0.6)
                    : (MediaQuery.of(context).size.height * 0.5),
                right: 0,
                left: 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: (shadowSwitcher) ? 0 : 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: (isSwitchedToNextTab) ? 0 : 1,
                              child: SizedBox(
                                height: 120,
                                width: 120,
                                child: Center(
                                  child: Image.asset(
                                    "images/home/AUSTIN.jpg",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          top: 125,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AnimatedPadding(
                                duration: const Duration(milliseconds: 200),
                                padding: EdgeInsets.only(
                                    top: (isSwitchedToNextTab) ? 50 : 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 25),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                95,
                                        height: 30,
                                        child: const Text(
                                          "Enough is Enough",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "AM",
                                            color: MyColors.whiteColor,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "Post Malne",
                                      style: TextStyle(
                                        fontFamily: "AM",
                                        fontSize: 14,
                                        color: MyColors.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  AnimatedOpacity(
                                    duration: const Duration(milliseconds: 250),
                                    opacity: (isSwitchedToNextTab) ? 0 : 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SongControlScreen(
                                                    trackName:
                                                        "Enough is Enough",
                                                    color: Color(0xff8b9a63),
                                                    singer: "Post Malone",
                                                    albumImage: "AUSTIN.jpg"),
                                          ),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  AnimatedOpacity(
                                    duration: const Duration(milliseconds: 250),
                                    opacity: (isSwitchedToNextTab) ? 0 : 1,
                                    child: Image.asset(
                                      'images/share.png',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 205,
                          right: 0,
                          left: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  AnimatedPadding(
                                    duration: const Duration(milliseconds: 200),
                                    padding: EdgeInsets.only(
                                        top: (isSwitchedToNextTab) ? 40 : 0),
                                    child: const PauseButton(
                                      iconWidth: 2.5,
                                      height: 40,
                                      iconHeight: 14,
                                      width: 40,
                                      color: MyColors.whiteColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  AnimatedOpacity(
                                    duration: const Duration(milliseconds: 250),
                                    opacity: (isSwitchedToNextTab) ? 0 : 1,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: MyColors.blackColor
                                            .withOpacity(0.3),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          "images/icon_back_song.png",
                                          height: 16,
                                          width: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  AnimatedOpacity(
                                    duration: const Duration(milliseconds: 250),
                                    opacity: (isSwitchedToNextTab) ? 0 : 1,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: MyColors.blackColor
                                            .withOpacity(0.3),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          "images/icon_next_song.png",
                                          height: 16,
                                          width: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 250),
                                opacity: (isSwitchedToNextTab) ? 0 : 1,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: (_isLiked)
                                      ? Image.asset(
                                          'images/icon_heart_filled.png',
                                          height: 22,
                                          width: 22,
                                        )
                                      : Image.asset(
                                          'images/icon_heart.png',
                                          color: Colors.white,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 260,
                          right: 0,
                          left: 0,
                          child: AnimatedPadding(
                            duration: const Duration(milliseconds: 200),
                            padding: EdgeInsets.only(
                                left: (isSwitchedToNextTab) ? 50 : 0),
                            child: Column(
                              children: [
                                SliderTheme(
                                  data: const SliderThemeData(
                                    trackHeight: 2,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 6.0),
                                    overlayShape: RoundSliderOverlayShape(
                                        overlayRadius: 0.0),
                                  ),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    width: MediaQuery.of(context).size.width,
                                    child: Slider(
                                      min: 0,
                                      max: 100,
                                      activeColor: const Color.fromARGB(
                                          255, 230, 229, 229),
                                      inactiveColor: const Color.fromARGB(
                                          255, 148, 147, 147),
                                      value: _currentNumber,
                                      onChanged: (onChanged) {
                                        setState(() {
                                          _currentNumber = onChanged;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 3),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 3),
                                        child: Text(
                                          "0:55",
                                          style: TextStyle(
                                            fontFamily: "AM",
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                                255, 230, 229, 229),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 2),
                                        child: Text(
                                          "2:45",
                                          style: TextStyle(
                                            fontFamily: "AM",
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                                255, 230, 229, 229),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOnPlaying = !isOnPlaying;
                        isSwitchedToNextTab = !isSwitchedToNextTab;
                      });
                    },
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:
                            (isOnPlaying) ? Colors.white : Colors.transparent,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Playing",
                            style: TextStyle(
                              fontFamily: "AM",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color:
                                  (isOnPlaying) ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOnPlaying = !isOnPlaying;
                        isSwitchedToNextTab = !isSwitchedToNextTab;
                        shadowSwitcher = false;
                      });
                    },
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:
                            (!isOnPlaying) ? Colors.white : Colors.transparent,
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Lyrics",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: (!isOnPlaying) ? Colors.black : Colors.white,
                          ),
                        ),
                      )),
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

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 250),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const ListeningOn(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;

                    final tween = Tween(begin: begin, end: end);
                    final offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: Image.asset(
              'images/icon_listen.png',
              height: 20,
              width: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
