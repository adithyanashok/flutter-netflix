import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/core/colors/url/strings.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});
  final _widgets = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: "Downloads"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (ctx, index) => _widgets[index],
        separatorBuilder: (ctx, index) => const SizedBox(
          height: 25,
        ),
        itemCount: _widgets.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  // final List images = [
  //   'https://static.wikia.nocookie.net/john-wick8561/images/7/7c/Chapterfour.jpeg/revision/latest?cb=20230523074638',
  //   'https://static.wikia.nocookie.net/john-wick8561/images/7/7c/Chapterfour.jpeg/revision/latest?cb=20230523074638',
  //   'https://static.wikia.nocookie.net/john-wick8561/images/7/7c/Chapterfour.jpeg/revision/latest?cb=20230523074638',
  // ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadEvent.getDownloadsImages());
    });
    // BlocProvider.of<DownloadsBloc>(context)
    //     .add(const DownloadEvent.getDownloadsImages());
    return Column(
      children: [
        const Text(
          "Introducing Downloads For Your",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Download your shows to watch offline,  Save your favourites easily and always have something to watch.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const CircularProgressIndicator()
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.35,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                        ),
                        DownloadsImageWidget(
                          images:
                              '$imageAppendUrl${state.downloads[0].posterPath}',
                          margin: const EdgeInsets.only(left: 170, bottom: 50),
                          angle: 20,
                          size: Size(size.width + 0.5, size.width * 0.45),
                        ),
                        DownloadsImageWidget(
                          images:
                              '$imageAppendUrl${state.downloads[1].posterPath}',
                          margin: const EdgeInsets.only(right: 170, bottom: 50),
                          angle: -20,
                          size: Size(size.width + 0.5, size.width * 0.45),
                        ),
                        DownloadsImageWidget(
                          images:
                              '$imageAppendUrl${state.downloads[2].posterPath}',
                          margin: const EdgeInsets.only(top: 0),
                          size: Size(size.width + 0.5, size.width * 0.55),
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: Colors.blue,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        MaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: Colors.white,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Smart Downloads",
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    this.angle = 0,
    required this.images,
    required this.margin,
    required this.size,
  });
  final double angle;
  final String images;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(
              images,
            ),
          ),
        ),
      ),
    );
  }
}
