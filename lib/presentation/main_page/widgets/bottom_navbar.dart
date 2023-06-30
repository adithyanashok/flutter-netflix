import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

ValueNotifier<int> changeIndexNotifier = ValueNotifier(0);

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: changeIndexNotifier,
      builder: (context, value, child) {
        return BottomNavigationBar(
          currentIndex: value,
          onTap: (index) {
            changeIndexNotifier.value = index;
          },
          backgroundColor: backgroundColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.collections),
              label: "New & Hot",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions_outlined),
                label: "Fast laughs"),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.download_for_offline_sharp),
                label: "Downloads"),
          ],
        );
      },
    );
  }
}
