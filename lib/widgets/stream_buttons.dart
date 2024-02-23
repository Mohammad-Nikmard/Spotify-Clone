import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';

class PlayButton extends StatelessWidget {
  const PlayButton(
      {super.key,
      required this.color,
      required this.height,
      required this.width});
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Image.asset("images/icon_play.png"),
        ),
      ),
    );
  }
}

class PauseButton extends StatelessWidget {
  const PauseButton({
    super.key,
    required this.color,
    required this.height,
    required this.width,
    required this.iconHeight,
    required this.iconWidth,
  });
  final double height;
  final double width;
  final Color color;
  final double iconHeight;
  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: iconWidth,
              height: iconHeight,
              color: MyColors.blackColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              height: iconHeight,
              width: iconWidth,
              color: MyColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}
