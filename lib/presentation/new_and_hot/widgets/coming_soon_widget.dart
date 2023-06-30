import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String desc;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(month),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(imgUrl: posterPath),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  // const Row(
                  // children: [
                  const CustomButtonWidget(
                    icon: Icons.notifications_outlined,
                    text: "Remind",
                    iconSize: 25,
                    textSize: 12,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const CustomButtonWidget(
                    icon: Icons.info_outline,
                    text: "Info",
                    iconSize: 25,
                    textSize: 12,
                  ),
                  const SizedBox(
                    width: 10,
                  )
                  //   ],
                  // )
                ],
              ),
              Text(
                "Coming on $day $month",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                desc,
                style: TextStyle(color: Colors.grey[500]),
              )
            ],
          ),
        ),
      ],
    );
  }
}
