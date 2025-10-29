import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:application/pages/dashboard_page.dart';
import 'package:application/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: getTabs(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: primary,
        child: const Icon(CupertinoIcons.creditcard, color: Colors.white),
        onPressed: () => setState(() {
          pageIndex = 4;
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: getBody(),
    );
  }

  Widget getTabs() {
    List<IconData> iconsItems = [
      Icons.grid_view_rounded,
      Icons.comment_rounded,
      Icons.notifications,
      Icons.account_circle,
    ];

    return AnimatedBottomNavigationBar(
      icons: iconsItems,
      activeColor: primary,
      splashColor: secondary,
      gapLocation:
          GapLocation.center, //The location of the gap between the icons.
      leftCornerRadius: 10,
      rightCornerRadius: 10,
      notchSmoothness: NotchSmoothness
          .softEdge, //The smoothness of the notch effect when an icon is selected.
      inactiveColor: Colors.black.withOpacity(0.5),
      activeIndex: pageIndex,
      onTap: (index) => setState(() => pageIndex = index),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      const Center(child: DashboardPage()),
      const Center(child: Text("Chat")),
      const Center(child: Text("Notification")),
      const Center(child: Text("Profile")),
      const Center(child: Text("Credit Card Page  ")),
    ];
    return IndexedStack(index: pageIndex, children: pages);
  }
}
