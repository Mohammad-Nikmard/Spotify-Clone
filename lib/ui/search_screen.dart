import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/ui/albumview_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomScrollView(
            slivers: [
              const _SearchBox(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AlbumViewScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Recent searches",
                      style: TextStyle(
                        fontFamily: "AM",
                        fontWeight: FontWeight.w400,
                        color: MyColors.whiteColor,
                        fontSize: 17,
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

class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width - 92.5,
              decoration: const BoxDecoration(
                color: Color(0xff282828),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Image.asset(
                      "images/icon_search_transparent.png",
                      color: MyColors.whiteColor,
                    ),
                    const Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontFamily: "AM",
                          fontSize: 16,
                          color: MyColors.whiteColor,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 10, left: 15),
                          hintText: "Search",
                          hintStyle: TextStyle(
                            fontFamily: "AM",
                            color: MyColors.whiteColor,
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.none,
                              width: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                    fontFamily: "AM", color: MyColors.whiteColor, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
