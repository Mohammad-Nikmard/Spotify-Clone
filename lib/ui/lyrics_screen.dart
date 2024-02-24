import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/widgets/stream_buttons.dart';

class LyricsScreen extends StatelessWidget {
  const LyricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff2b8094),
      body: Column(
        children: [
          _Header(),
          SizedBox(height: 20),
          _Lyrics(),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: _ActionButtons(),
          ),
        ],
      ),
    );
  }
}

class _Lyrics extends StatelessWidget {
  const _Lyrics();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 310,
        width: MediaQuery.of(context).size.width,
        child: const SingleChildScrollView(
          child: Column(
            children: [
              Text(
                """
2 AM, they ran out of lemonade
So I shot that vodka straight, anyway
She came in, missin' bottle off the shelf
I can't drink this by myself, sit with me, babe
Then I started laughin'
Like it was funny, but it really ain't funny, uh
Take me home, don't shut me out
It's easier to leave me down here on the ground
Take me home, baby, I'm fucked up now
I know it's easier to leave me down here on the ground""",
                style: TextStyle(
                  color: MyColors.whiteColor,
                  fontFamily: "AM",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              Text(
                """
'Cause enough is enough
I can't stand up
I can't stand, can't stand, 'causе enough is enough
Long nights in the city of sin
Thеy said I pick fights that I won't ever win
I got a bad bitch that'll bring all her friends
But when I'm with you it's like I'm livin' again
And baby, I'm shit-faced sittin' on the sidewalk
Ain't nobody listenin' when I talk
I fall down and laugh, but it really ain't funny, uh
Take me home, don't shut me out
It's easier to leave me down here on the ground
Take me home, baby, I'm fucked up now
I know it's easier to leave me down here on the ground
'Cause enough is enough (Shut me out)
I can't stand up (I, I)
I can't stand, can't stand, 'cause enough is enough (I, I)
Hah, hah, I can't stand up
Ah-ah-ah, I, I can't stand, can't stand
2 AM, they ran out of lemonade
So I shot that vodka straight, anyway (Ooh)
""",
                style: TextStyle(
                  color: MyColors.blackColor,
                  fontFamily: "AM",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff000000).withOpacity(0.4),
              ),
              child: const Center(
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
          ),
          const Column(
            children: [
              Text(
                "Enough is Enough",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "AM",
                  color: MyColors.whiteColor,
                  fontSize: 18,
                ),
              ),
              Text(
                "Post Malone",
                style: TextStyle(
                  fontFamily: "AM",
                  fontSize: 12,
                  color: Color.fromARGB(255, 253, 239, 239),
                ),
              ),
            ],
          ),
          Image.asset(
            'images/icon_flag.png',
            height: 24,
            width: 24,
          ),
        ],
      ),
    );
  }
}

class _ActionButtons extends StatefulWidget {
  const _ActionButtons();

  @override
  State<_ActionButtons> createState() => __ActionButtonsState();
}

class __ActionButtonsState extends State<_ActionButtons> {
  double _currentNumber = 30;
  bool _isInPlay = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SliderTheme(
            data: const SliderThemeData(
              trackHeight: 2,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Slider(
                min: 0,
                max: 100,
                activeColor: const Color.fromARGB(255, 230, 229, 229),
                inactiveColor: const Color.fromARGB(255, 199, 196, 196),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "0:55",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 12,
                    color: Color.fromARGB(255, 230, 229, 229),
                  ),
                ),
                Text(
                  "2:45",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 12,
                    color: Color.fromARGB(255, 230, 229, 229),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'images/icon_sing.png',
                height: 20,
                width: 20,
                color: Colors.white,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _isInPlay = !_isInPlay;
                  });
                },
                child: (_isInPlay)
                    ? const PauseButton(
                        iconWidth: 5,
                        color: MyColors.whiteColor,
                        height: 60,
                        width: 60,
                        iconHeight: 20,
                      )
                    : const PlayButton(
                        color: MyColors.whiteColor,
                        height: 60,
                        width: 60,
                      ),
              ),
              Image.asset(
                'images/share.png',
                color: Colors.white,
                height: 20,
                width: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
