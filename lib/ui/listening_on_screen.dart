import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';

class ListeningOn extends StatefulWidget {
  const ListeningOn({super.key});

  @override
  State<ListeningOn> createState() => _ListeningOnState();
}

class _ListeningOnState extends State<ListeningOn> {
  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: MyColors.blackColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Container(
                    width: 62,
                    height: 5,
                    decoration: BoxDecoration(
                      color: MyColors.darGreyColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset("images/icon_back.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 18,
                            width: 4,
                            color: MyColors.greenColor,
                          ),
                          const SizedBox(width: 2),
                          Container(
                            height: 17,
                            width: 4,
                            color: MyColors.greenColor,
                          ),
                          const SizedBox(width: 2),
                          Container(
                            height: 14,
                            width: 4,
                            color: MyColors.greenColor,
                          ),
                          const SizedBox(width: 2),
                          Container(
                            height: 11,
                            width: 4,
                            color: MyColors.greenColor,
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Listening on",
                            style: TextStyle(
                              fontFamily: "AM",
                              fontSize: 25,
                              color: MyColors.whiteColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset('images/icon_bluetooth.png'),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Airpod 3",
                                style: TextStyle(
                                  fontFamily: "AM",
                                  fontSize: 15,
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
                const SizedBox(
                  height: 25,
                ),
                const _SelectDeviceSection(),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Start a Group Seassion",
                          style: TextStyle(
                            fontFamily: "AB",
                            fontSize: 18,
                            color: MyColors.whiteColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Image.asset('images/icon_beta.png'),
                            const Text(
                              "BETA",
                              style: TextStyle(
                                fontFamily: "AB",
                                fontSize: 9,
                                color: MyColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Listen with firends, in real time. Pick what to play and control the music together",
                      style: TextStyle(
                        fontFamily: "AM",
                        color: MyColors.lightGrey,
                        fontSize: 12.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("images/myImage.png"),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(169, 46),
                      backgroundColor: MyColors.greenColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Start Session",
                      style: TextStyle(
                        fontFamily: "AB",
                        fontSize: 17,
                        color: MyColors.blackColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    height: 28,
                    width: 106,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: MyColors.lightGrey,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Scan to join",
                        style: TextStyle(
                          fontFamily: "AM",
                          fontSize: 13,
                          color: MyColors.lightGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Image.asset('images/icon_audio.png'),
                    SliderTheme(
                      data: const SliderThemeData(
                        trackHeight: 2,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 7),
                      ),
                      child: Expanded(
                        child: Slider(
                          min: 0,
                          max: 100,
                          thumbColor: MyColors.whiteColor,
                          activeColor: MyColors.greenColor,
                          inactiveColor: MyColors.lightGrey,
                          value: _value,
                          onChanged: (onChanged) {
                            setState(() {
                              _value = onChanged;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SelectDeviceSection extends StatelessWidget {
  const _SelectDeviceSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select a device",
          style: TextStyle(
            fontFamily: "AB",
            fontSize: 16,
            color: MyColors.whiteColor,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Image.asset('images/icon_monitor.png'),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "BRAVIA 4K GB",
                  style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 17,
                      color: MyColors.whiteColor,
                      fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    Image.asset('images/icon_cast.png'),
                    const SizedBox(width: 3),
                    const Text(
                      "Google Cast",
                      style: TextStyle(
                        fontFamily: "AM",
                        color: MyColors.lightGrey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('images/icon_tv.png'),
                const SizedBox(width: 15),
                const Text(
                  "Mohammad's MacBook Pro",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 17,
                    color: MyColors.whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Image.asset('images/icon_more.png'),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Image.asset('images/icon_airplay.png'),
            const SizedBox(width: 10),
            const Text(
              "Airplay or Bluetooth",
              style: TextStyle(
                fontFamily: "AM",
                fontSize: 17,
                color: MyColors.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
