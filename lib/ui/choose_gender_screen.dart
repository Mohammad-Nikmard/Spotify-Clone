import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/ui/create_name_screen.dart';

class ChooseGenderScreen extends StatefulWidget {
  const ChooseGenderScreen({super.key});

  @override
  State<ChooseGenderScreen> createState() => _ChooseGenderScreenState();
}

class _ChooseGenderScreenState extends State<ChooseGenderScreen> {
  String dropdownValue = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darGreyColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const _Header(),
              const Row(
                children: [
                  SizedBox(width: 3),
                  Text(
                    "What's your gender?",
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
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: DropdownButton(
                    dropdownColor: MyColors.lightGrey,
                    itemHeight: 50.0,
                    isExpanded: true,
                    icon: Image.asset("images/icon_tic.png"),
                    underline: Container(),
                    items: const [
                      DropdownMenuItem<String>(
                        value: "Male",
                        child: Text(
                          "Male",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "AM",
                          ),
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: "Female",
                        child: Text(
                          "Female",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "AM",
                          ),
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: "Prefres not to say",
                        child: Text(
                          "Prefer not to say",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "AM",
                          ),
                        ),
                      ),
                    ],
                    onChanged: (onChanged) {
                      setState(() {
                        dropdownValue = onChanged!;
                      });
                    },
                    value: dropdownValue,
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateNameScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 45,
                  width: 90,
                  decoration: const BoxDecoration(
                    color: MyColors.whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontFamily: "AB",
                        color: Colors.black,
                        fontSize: 15,
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
