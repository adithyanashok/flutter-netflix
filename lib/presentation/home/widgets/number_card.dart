import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({super.key, required this.index, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(height: 10, width: 40),
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                    imageUrl,
                  ),
                ),
              ),
            ),
          ],
        ),
        //-------------- Numbers ---------------------//
        Positioned(
            left: 10,
            bottom: 0,
            child: BorderedText(
              strokeColor: Colors.white,
              child: Text(
                "${index + 1}",
                style: const TextStyle(
                  fontSize: 140,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                ),
              ),
            ))
      ],
    );
  }
}
