import 'package:flutter/material.dart';
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
                      fontWeight: FontWeight.w700,
                      color: MyColors.whiteColor,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ImageContainer(title: "", image: "pop.png"),
                    _ImageContainer(title: "", image: "indie.png"),
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
                      fontWeight: FontWeight.w700,
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
                    const _ImageContainer(title: "Comdey", image: "comedy.png"),
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
                      fontWeight: FontWeight.w700,
                      color: MyColors.whiteColor,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ImageContainer(
                        title: "2023 Wrapped", image: "2023_wrapped.png"),
                    _ImageContainer(title: "Podcasts", image: "podcasts.png"),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _ImageContainer(
                          title: "Made for you", image: "made_for_you.png"),
                      _ImageContainer(title: "Charts", image: "charts.png"),
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

class _ImageContainer extends StatelessWidget {
  const _ImageContainer({required this.title, required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 109,
          width: 192,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/$image"),
              fit: BoxFit.cover,
            ),
            color: Colors.red,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: "AB",
              fontSize: 16,
              color: MyColors.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
