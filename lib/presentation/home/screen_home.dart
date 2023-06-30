import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/home/home_bloc.dart';
import 'package:netflix_app/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_app/core/colors/url/strings.dart';
import 'package:netflix_app/presentation/home/widgets/background_main_card.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_app/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_app/presentation/widgets/main_card_title.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            print(direction);
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.isError) {
                    return const Center(
                        child: Text("Error while loading data"));
                  }

                  final releasedPastYear = state.pastYearMovieList.map((e) {
                    return '$imageAppendUrl${e.posterPath}';
                  }).toList();

                  final trending = state.trendingMovieList.map((e) {
                    return '$imageAppendUrl${e.posterPath}';
                  }).toList();
                  trending.shuffle();

                  final trendingTv = state.trendingTvList.map((e) {
                    return '$imageAppendUrl${e.posterPath}';
                  }).toList();

                  final tense = state.tenseDramasMovieList.map((e) {
                    return '$imageAppendUrl${e.posterPath}';
                  }).toList();

                  final south = state.southIndianMovieList.map((e) {
                    return '$imageAppendUrl${e.posterPath}';
                  }).toList();

                  south.shuffle();
                  trending.shuffle();
                  trending.shuffle();
                  return ListView(
                    children: [
                      const BackgroundMainCard(),
                      MainCardTitle(
                          title: "Released in the Past Year",
                          posterList: releasedPastYear.sublist(0, 10)),
                      MainCardTitle(
                          title: "Trending Now", posterList: trending),
                      NumberTitleCard(posterList: trendingTv.sublist(0, 10)),
                      MainCardTitle(title: "Tense Dramas", posterList: tense),
                      MainCardTitle(
                          title: "South Indian Cinemas", posterList: south),
                    ],
                  );
                },
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(0.3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/netflix_logo.png',
                                width: 69,
                                height: 50,
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                color: Colors.white,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                color: Colors.blue,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TV Shows",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Movies",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Categories",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(
                      height: 10,
                    )
            ],
          ),
        );
      },
    ));
  }
}
