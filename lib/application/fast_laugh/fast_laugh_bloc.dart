import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
// import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
];

ValueNotifier<Set<int>> likedVideosNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRepo _downloadsService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      emit(
        const FastLaughState(
          videoList: [],
          isLoading: true,
          isError: false,
        ),
      );
      final _result = await _downloadsService.getDownloadsImages();
      final _state = _result.fold(
        (l) => FastLaughState(
          videoList: [],
          isLoading: false,
          isError: true,
        ),
        (resp) => FastLaughState(
          videoList: resp,
          isLoading: false,
          isError: false,
        ),
      );
      emit(_state);
    });

    on<Like>((event, emit) {
      likedVideosNotifier.value.add(event.id);
    });
    on<UnLike>((event, emit) {
      likedVideosNotifier.value.remove(event.id);
    });
  }
}
