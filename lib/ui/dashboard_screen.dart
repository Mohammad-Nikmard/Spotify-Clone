import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/constants/constants.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  void _goToBranch(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        height: 64,
        width: MediaQuery.of(context).size.width,
        color: MyColors.blackColor.withOpacity(0.95),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedLabelStyle: const TextStyle(fontFamily: "AM", fontSize: 13),
            selectedItemColor: const Color(0xffE5E5E5),
            unselectedItemColor: MyColors.lightGrey,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
              _goToBranch(_currentIndex);
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_home.png'),
                activeIcon: Image.asset('images/icon_home_active.png'),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'images/icon_search_bottomnav.png',
                ),
                activeIcon: Image.asset(
                  'images/icon_search_active.png',
                  color: MyColors.whiteColor,
                ),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'images/icon_library.png',
                  color: MyColors.lightGrey,
                ),
                activeIcon: Image.asset(
                  'images/icon_library_active.png',
                  color: MyColors.whiteColor,
                ),
                label: "Your Library",
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: widget.navigationShell,
      ),
    );
  }
}
