import 'package:flutter/material.dart';

class NewAndHotAppBar extends StatelessWidget {
  const NewAndHotAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "New & Hot",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
      bottom: TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.white,
        isScrollable: true,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        tabs: const [
          Tab(
            text: "🍿Coming Soon",
          ),
          Tab(
            text: "👀 Everyone's watching",
          ),
        ],
      ),
    );
  }
}
