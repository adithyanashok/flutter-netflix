import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_app/core/colors/url/strings.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/everyones_watching_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/new_and_hot_app_bar.dart';

class ScreenHotAndNew extends StatelessWidget {
  const ScreenHotAndNew({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: NewAndHotAppBar(),
        ),
        body: TabBarView(
          children: [
            ComingSoonList(
              key: Key('coming_soon'),
            ),
            EveryOneIsWatchingList()
          ],
        ),
      ),
    );
  }

  // Widget _buildComingSoon() {
  //   return ListView.builder(
  //     itemCount: 10,
  //     itemBuilder: (context, index) {
  //       return const ComingSoonWidget();
  //     },
  //   );
  // }

  // Widget _buildEveryonesWatching() {
  //   return ListView.builder(
  //     itemCount: 10,
  //     itemBuilder: (context, index) => const SizedBox(),
  //   );
  // }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context).add(const LoadComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          // check loading
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
            // check errors
          } else if (state.isError) {
            return const Center(child: Text("Error while getting data"));
            // check list is empty
          } else if (state.commingSoonList.isEmpty) {
            return const Center(child: Text("List is empty"));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: state.commingSoonList.length,
              itemBuilder: (context, index) {
                final movie = state.commingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                final date = DateTime.parse(movie.releaseDate!);
                final formatedDate = DateFormat.yMMMMd('en_US').format(date);
                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase(),
                  day: movie.releaseDate!.split('-')[1],
                  posterPath: '$imageAppendUrl${movie.backdropPath}',
                  movieName: movie.originalTitle ?? 'No Title',
                  desc: movie.overview ?? 'No Description',
                );
              },
            );
          }
        },
      ),
    );
  }
}

class EveryOneIsWatchingList extends StatelessWidget {
  const EveryOneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadEveryoneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadEveryoneIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          // check loading
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
            // check errors
          } else if (state.isError) {
            return const Center(child: Text("Error while getting data"));
            // check list is empty
          } else if (state.everyonIsWatchingList.isEmpty) {
            return const Center(child: Text("List is empty"));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: state.everyonIsWatchingList.length,
              itemBuilder: (context, index) {
                final tv = state.everyonIsWatchingList[index];

                return EveryonesWatchingWidget(
                  posterPath: '$imageAppendUrl${tv.backdropPath}',
                  movieName: tv.originalName ?? "No name",
                  desc: tv.overview ?? "No description",
                );
              },
            );
          }
        },
      ),
    );
  }
}
