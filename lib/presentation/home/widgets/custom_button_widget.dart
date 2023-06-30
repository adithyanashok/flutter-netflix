import 'package:flutter/material.dart';

TextButton playButton() {
  return TextButton.icon(
    onPressed: () {},
    icon: const Icon(
      Icons.play_arrow,
      size: 25,
    ),
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "Play",
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        Colors.white,
      ),
      iconColor: MaterialStateProperty.all(Colors.black),
      // textStyle: MaterialStateProperty.all(value)
    ),
  );
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize = 30,
    this.textSize = 14,
  });
  final IconData icon;
  final String text;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: iconSize,
        ),
        Text(
          text,
          style: TextStyle(fontSize: textSize),
        ),
      ],
    );
  }
}
