import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widgets/number_card.dart';
import 'package:netflix_app/presentation/widgets/main_title_widget.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.posterList,
  });

  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitleWidget(
          title: "Top 10 TV Shows in India Toady",
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                posterList.length,
                (index) => NumberCard(
                      index: index,
                      imageUrl: posterList[index],
                    )),
          ),
        ),
      ],
    );
  }
}
