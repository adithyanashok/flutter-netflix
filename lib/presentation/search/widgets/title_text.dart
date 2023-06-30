import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        // const SizedBox(
        //   height: 10,
        // )
      ],
    );
  }
}
