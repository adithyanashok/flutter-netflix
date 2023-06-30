import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/core/colors/url/strings.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class videoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const videoListItemInheritedWidget(
      {super.key, required this.widget, required this.movieData})
      : super(child: widget);

  @override
  bool updateShouldNotify(covariant videoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static videoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<videoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterPath =
        videoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyVideoUrl[index % dummyVideoUrl.length];
    return Stack(
      children: [
        VideoPlayerWidget(
          videoUrl: videoUrl,
          onStateChanged: (bool) {},
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            // Left Side //
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                // Right side //
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage('$imageAppendUrl$posterPath'),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosNotifier,
                      builder: (context, value, child) {
                        final _index = index;
                        if (value.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideosNotifier.value.remove(_index);
                              likedVideosNotifier.notifyListeners();
                              // BlocProvider.of<FastLaughBloc>(context)
                              //     .add(UnLike(id: _index));
                            },
                            child: const VideoActionsWidget(
                              icon: Icons.emoji_emotions,
                              title: "Liked",
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            likedVideosNotifier.value.add(_index);
                            likedVideosNotifier.notifyListeners();

                            // BlocProvider.of<FastLaughBloc>(context)
                            //     .add(Like(id: _index));
                          },
                          child: const VideoActionsWidget(
                            icon: Icons.emoji_emotions_outlined,
                            title: "LOL",
                          ),
                        );
                      },
                    ),
                    const VideoActionsWidget(
                      icon: Icons.add,
                      title: "My List",
                    ),
                    GestureDetector(
                      onTap: () {
                        final movieName = videoListItemInheritedWidget
                            .of(context)
                            ?.movieData
                            .title;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: const VideoActionsWidget(
                        icon: Icons.share,
                        title: "Share",
                      ),
                    ),
                    const VideoActionsWidget(
                        icon: Icons.play_arrow, title: "Play"),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const VideoPlayerWidget(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
