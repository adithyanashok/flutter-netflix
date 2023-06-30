import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/downloads/screen_download.dart';
import 'package:netflix_app/presentation/fast_laughs/fast_laughs.dart';
import 'package:netflix_app/presentation/home/screen_home.dart';
import 'package:netflix_app/presentation/main_page/widgets/bottom_navbar.dart';
import 'package:netflix_app/presentation/new_and_hot/new_and_hot.dart';
import 'package:netflix_app/presentation/search/search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final _pages = [
    const ScreenHome(),
    const ScreenHotAndNew(),
    const ScreenFastLaughs(),
    ScreenSearch(),
    ScreenDownload()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: changeIndexNotifier,
          builder: (context, value, child) {
            return _pages[value];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
