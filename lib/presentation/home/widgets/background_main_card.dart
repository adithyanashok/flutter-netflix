import 'package:flutter/material.dart';

import 'custom_button_widget.dart';

class BackgroundMainCard extends StatelessWidget {
  const BackgroundMainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://cdn.marvel.com/content/1x/jam_payoff_digital_ka_v7_lg.jpg',
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButtonWidget(
                icon: Icons.add,
                text: "My List",
              ),
              playButton(),
              const CustomButtonWidget(
                icon: Icons.info_outline_rounded,
                text: "Info",
              ),
            ],
          ),
        )
      ],
    );
  }
}
