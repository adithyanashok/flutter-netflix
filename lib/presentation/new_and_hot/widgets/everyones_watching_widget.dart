import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String desc;
  const EveryonesWatchingWidget({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          movieName,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          desc,
          style: TextStyle(color: Colors.grey[500]),
        ),
        const SizedBox(
          height: 40,
        ),
        VideoWidget(imgUrl: posterPath),
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.share,
              text: "Share",
              iconSize: 30,
            ),
            SizedBox(
              width: 14,
            ),
            CustomButtonWidget(
              icon: Icons.add,
              text: "My List",
              iconSize: 30,
            ),
            SizedBox(
              width: 14,
            ),
            CustomButtonWidget(
              icon: Icons.play_circle,
              text: "Play",
              iconSize: 30,
            ),
            SizedBox(
              width: 14,
            ),
          ],
        )
      ],
    );
  }
}
