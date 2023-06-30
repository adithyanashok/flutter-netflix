import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/domain/core/main_failures.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';

import '../../domain/downloads/models/downloads.dart';

part 'downloads_event.dart';

part 'downloads_state.dart';

part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadEvent, DownloadsState> {
  final IDownloadsRepo _iDownloads;

  DownloadsBloc(this._iDownloads) : super(DownloadsState.initial()) {
    on<_GetDownloadsImages>((event, emit) async {
      emit(
        state.copyWith(isLoading: true, downloadsOptions: none()),
      );
      final Either<MainFailure, List<Downloads>> downloadsOpt =
          await _iDownloads.getDownloadsImages();
      print(downloadsOpt.toString());
      emit(
        downloadsOpt.fold(
          (failure) => state.copyWith(
            isLoading: false,
            downloadsOptions: Some(
              Left(failure),
            ),
          ),
          (success) => state.copyWith(
            isLoading: false,
            downloads: success,
            downloadsOptions: Some(
              Right(success),
            ),
          ),
        ),
      );
    });
  }
}
