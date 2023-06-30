import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/widgets/main_card.dart';
import 'package:netflix_app/presentation/widgets/main_title_widget.dart';

class MainCardTitle extends StatelessWidget {
  final String title;
  final List<String> posterList;
  const MainCardTitle(
      {super.key, required this.title, required this.posterList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitleWidget(
          title: title,
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                posterList.length,
                (index) => MainCardWidget(
                      imageUrl: posterList[index],
                    )),
          ),
        ),
      ],
    );
  }
}
