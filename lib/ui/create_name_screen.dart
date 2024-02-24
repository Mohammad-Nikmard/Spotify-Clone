import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/DI/service_locator.dart';
import 'package:spotify_clone/bloc/artist/artist_bloc.dart';
import 'package:spotify_clone/bloc/artist/artist_event.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/ui/choose_artist_screen.dart';

class CreateNameScreen extends StatefulWidget {
  const CreateNameScreen({super.key});

  @override
  State<CreateNameScreen> createState() => _CreateNameScreenState();
}

class _CreateNameScreenState extends State<CreateNameScreen> {
  bool newsCheck = false;
  bool marketPurposeCheck = false;
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.darGreyColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const _Header(),
              const Row(
                children: [
                  SizedBox(width: 3),
                  Text(
                    "What's your name?",
                    style: TextStyle(
                      fontFamily: "AB",
                      fontSize: 20,
                      color: MyColors.whiteColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Container(
                height: 51,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xff777777),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              text = value;
                            });
                          },
                          style: const TextStyle(
                            fontFamily: "AM",
                            fontSize: 14,
                            color: MyColors.whiteColor,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.none,
                                width: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: (text.length > 6) ? true : false,
                        child: Image.asset("images/icon_tic.png"),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Row(
                children: [
                  Text(
                    "This appears on your spotify profile",
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 10,
                      color: MyColors.whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Divider(
                thickness: 1.3,
                color: MyColors.lightGrey,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'By tapping on "Create account" you agree to the spotify Terms of Use.',
                style: TextStyle(
                  fontFamily: "AM",
                  fontSize: 12,
                  color: MyColors.whiteColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Terms of Use',
                style: TextStyle(
                  fontFamily: "AM",
                  fontSize: 12,
                  color: MyColors.greenColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'To learn more about how spotify collect, uses, shares and portects your personal data, Please see the spotify Privacy Policy.',
                style: TextStyle(
                  fontFamily: "AM",
                  fontSize: 12,
                  color: MyColors.whiteColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Privacy Policy',
                style: TextStyle(
                  fontFamily: "AM",
                  fontSize: 12,
                  color: MyColors.greenColor,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    "Please send me news and offers from spotify.",
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 12,
                      color: MyColors.whiteColor,
                    ),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      shape: const CircleBorder(),
                      activeColor: MyColors.greenColor,
                      checkColor: MyColors.whiteColor,
                      value: newsCheck,
                      onChanged: (onChanged) {
                        setState(() {
                          newsCheck = onChanged!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 290,
                    child: Text(
                      "Share my registration data with Spotify's content providers for marketing purposes.",
                      style: TextStyle(
                        fontFamily: "AM",
                        fontSize: 12,
                        color: MyColors.whiteColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      shape: const CircleBorder(),
                      activeColor: MyColors.greenColor,
                      checkColor: MyColors.whiteColor,
                      value: marketPurposeCheck,
                      onChanged: (onChanged) {
                        setState(() {
                          marketPurposeCheck = onChanged!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (text.length > 6) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) {
                              var bloc = ArtistBloc(locator.get());
                              bloc.add(ArtistListEvent());
                              return bloc;
                            },
                            child: const ChooseArtistScreen(),
                          ),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: Container(
                      height: 42,
                      width: 179,
                      decoration: BoxDecoration(
                        color: (text.length > 6)
                            ? MyColors.whiteColor
                            : MyColors.lightGrey,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Create an account",
                          style: TextStyle(
                            fontFamily: "AB",
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
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

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35, top: 35),
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.blackColor,
              ),
              child: Center(
                child: Image.asset(
                  "images/icon_arrow_left.png",
                  height: 16,
                  width: 16,
                ),
              ),
            ),
          ),
          const Text(
            "Create Account",
            style: TextStyle(
              fontFamily: "AB",
              fontSize: 16,
              color: MyColors.whiteColor,
            ),
          ),
          const SizedBox(
            height: 32,
            width: 32,
          ),
        ],
      ),
    );
  }
}
