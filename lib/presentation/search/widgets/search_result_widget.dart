import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/colors/url/strings.dart';
import 'package:netflix_app/presentation/search/widgets/title_text.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(title: "Movies & Tv"),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1 / 1.5,
                  children: List.generate(
                    10,
                    (index) {
                      final movie = state.searchResultList[index];
                      return MainCard(
                        imgUrl: "$imageAppendUrl${movie.posterPath}",
                      );
                    },
                  ));
            },
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imgUrl;
  const MainCard({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              imgUrl,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
