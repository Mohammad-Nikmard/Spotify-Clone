import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify_clone/constants/constants.dart';

class SearchCategoryScreen extends StatelessWidget {
  const SearchCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Search",
                        style: TextStyle(
                          fontFamily: "AB",
                          fontSize: 25,
                          color: MyColors.whiteColor,
                        ),
                      ),
                      Image.asset("images/icon_camera.png"),
                    ],
                  ),
                ),
              ),
              const _SearchBox(),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 17, bottom: 17),
                  child: Text(
                    "Your top genres",
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.whiteColor,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("images/pop.png"),
                    Image.asset("images/indie.png"),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 10),
                  child: Text(
                    "Popular podcast categories",
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.whiteColor,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Image.asset("images/news&politics.png"),
                        const Positioned(
                          top: 10,
                          left: 10,
                          child: SizedBox(
                            width: 72,
                            child: Text(
                              "News & Politics",
                              style: TextStyle(
                                fontFamily: "AB",
                                fontSize: 16,
                                color: MyColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Image.asset("images/comedy.png"),
                        const Positioned(
                          top: 10,
                          left: 10,
                          child: Text(
                            "Comedy",
                            style: TextStyle(
                              fontFamily: "AB",
                              fontSize: 16,
                              color: MyColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 10),
                  child: Text(
                    "Browse all",
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.whiteColor,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Image.asset("images/2023_wrapped.png"),
                        const Positioned(
                          top: 10,
                          left: 10,
                          child: Text(
                            "2023 Wrapped",
                            style: TextStyle(
                              fontFamily: "AB",
                              fontSize: 16,
                              color: MyColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Image.asset("images/podcasts.png"),
                        const Positioned(
                          top: 10,
                          left: 10,
                          child: Text(
                            "Podcasts",
                            style: TextStyle(
                              fontFamily: "AB",
                              fontSize: 16,
                              color: MyColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Image.asset("images/made_for_you.png"),
                          const Positioned(
                            top: 10,
                            left: 10,
                            child: Text(
                              "Made for you",
                              style: TextStyle(
                                fontFamily: "AB",
                                fontSize: 16,
                                color: MyColors.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Image.asset("images/charts.png"),
                          const Positioned(
                            top: 10,
                            left: 10,
                            child: Text(
                              "Charts",
                              style: TextStyle(
                                fontFamily: "AB",
                                fontSize: 16,
                                color: MyColors.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
      child: Container(
        height: 46,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: MyColors.whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Image.asset("images/icon_search_black.png"),
              const Expanded(
                child: TextField(
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 16,
                    color: MyColors.blackColor,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15, left: 15),
                    hintText: "Artists, songs, or podcasts",
                    hintStyle: TextStyle(
                      fontFamily: "AM",
                      color: MyColors.blackColor,
                      fontSize: 14,
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
    );
  }
}
