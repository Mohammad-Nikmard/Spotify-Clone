import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marquee/marquee.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/ui/listening_on_screen.dart';
import 'package:spotify_clone/ui/track_view_screen.dart';

class BottomPlayer extends StatefulWidget {
  const BottomPlayer({super.key});

  @override
  State<BottomPlayer> createState() => _BottomPlayerState();
}

class _BottomPlayerState extends State<BottomPlayer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 59,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color(0xff550A1C),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const TrackViewScreen(),
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
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 37,
                            width: 37,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('images/song_screen.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 160,
                                height: 20,
                                child: Marquee(
                                  text: 'From Me to You - Mono / Remastered',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "AM",
                                    color: MyColors.whiteColor,
                                    fontSize: 13.5,
                                  ),
                                  scrollAxis: Axis.horizontal,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  blankSpace: 25.0,
                                  velocity: 60.0,
                                  pauseAfterRound: const Duration(seconds: 5),
                                  startPadding: 5.0,
                                  accelerationDuration:
                                      const Duration(seconds: 1),
                                  accelerationCurve: Curves.linear,
                                  decelerationDuration:
                                      const Duration(milliseconds: 500),
                                  decelerationCurve: Curves.easeOut,
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "images/icon_bluetooth.png",
                                    height: 15,
                                    width: 15,
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    "Airpod 3",
                                    style: TextStyle(
                                      fontFamily: "AM",
                                      fontSize: 10.5,
                                      color: MyColors.greenColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return DraggableScrollableSheet(
                                    minChildSize: 0.9,
                                    maxChildSize: 0.9,
                                    initialChildSize: 0.9,
                                    builder: (context, contorller) {
                                      return ListeningOn(
                                          controller: contorller);
                                    },
                                  );
                                },
                              );
                            },
                            child: Image.asset(
                              'images/bluetooth.png',
                              height: 29,
                              width: 29,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 5,
                                  color: MyColors.whiteColor,
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  height: 20,
                                  width: 5,
                                  color: MyColors.whiteColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliderTheme(
                data: SliderThemeData(
                  overlayShape: SliderComponentShape.noOverlay,
                  thumbShape: SliderComponentShape.noThumb,
                  trackShape: const RectangularSliderTrackShape(),
                  trackHeight: 3,
                ),
                child: SizedBox(
                  height: 8,
                  child: Slider(
                    activeColor: const Color(0xffB2B2B2),
                    inactiveColor: const Color(0xff702F3D),
                    value: 0.5,
                    onChanged: (onChanged) {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
