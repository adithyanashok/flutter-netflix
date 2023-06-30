import 'package:flutter/material.dart';

class MainCardWidget extends StatelessWidget {
  final String imageUrl;
  const MainCardWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
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
    );
  }
}
