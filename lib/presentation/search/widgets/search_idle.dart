import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/colors/url/strings.dart';
import 'package:netflix_app/presentation/search/widgets/title_text.dart';

// const imageUrl =
//     'https://cdn.fandomwire.com/wp-content/uploads/2022/12/04070103/jhone-wick-4-758x426.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(title: "Top Searches"),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(child: Text("Error while getting data"));
              } else if (state.idleResult.isEmpty) {
                return const Center(child: Text("No movies found"));
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final movie = state.idleResult[index];
                    return SearchItemTileWidget(
                        title: movie.title ?? "No title provided",
                        imageUrl: "$imageAppendUrl${movie.posterPath}");
                  },
                  separatorBuilder: (ctx, index) => const SizedBox(
                        height: 15,
                      ),
                  itemCount: state.idleResult.length);
            },
          ),
        )
      ],
    );
  }
}

class SearchItemTileWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  const SearchItemTileWidget(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 22,
            child: Icon(
              CupertinoIcons.play_fill,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
