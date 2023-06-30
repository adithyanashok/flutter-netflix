import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/main_failures.dart';
import 'package:netflix_app/domain/new_and_hot/model/hot_and_n_ew.dart';
import 'package:netflix_app/domain/new_and_hot/new_and_hot_service.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewSerice _hotAndNewSerice;
  HotAndNewBloc(this._hotAndNewSerice) : super(HotAndNewState.initial()) {
    // Send Loading to ui
    emit(const HotAndNewState(
      commingSoonList: [],
      everyonIsWatchingList: [],
      isLoading: true,
      isError: false,
    ));

    on<LoadComingSoon>((event, emit) async {
      final _result = await _hotAndNewSerice.getHotAndNewMovie();
      final _state = _result.fold((MainFailure failure) {
        return const HotAndNewState(
          commingSoonList: [],
          everyonIsWatchingList: [],
          isLoading: false,
          isError: true,
        );
      }, (HotAndNewResp resp) {
        return HotAndNewState(
          commingSoonList: resp.results,
          everyonIsWatchingList: state.everyonIsWatchingList,
          isLoading: false,
          isError: false,
        );
      });
      emit(_state);
    });

    on<LoadEveryoneIsWatching>((event, emit) async {
      final _result = await _hotAndNewSerice.getHotAndNewTv();
      final _state = _result.fold((MainFailure failure) {
        return const HotAndNewState(
          commingSoonList: [],
          everyonIsWatchingList: [],
          isLoading: false,
          isError: true,
        );
      }, (HotAndNewResp resp) {
        return HotAndNewState(
          commingSoonList: state.commingSoonList,
          everyonIsWatchingList: resp.results,
          isLoading: false,
          isError: false,
        );
      });
      emit(_state);
    });
  }
}
