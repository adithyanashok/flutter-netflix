import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/main_failures.dart';
import 'package:netflix_app/domain/new_and_hot/model/hot_and_n_ew.dart';
import 'package:netflix_app/domain/new_and_hot/new_and_hot_service.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HotAndNewSerice _homeService;
  HomeBloc(this._homeService) : super(HomeState.initialize()) {
    // on event
    on<HomeEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, isError: false));
      final _movieResult = await _homeService.getHotAndNewMovie();
      final _tvResult = await _homeService.getHotAndNewTv();

      final stateOne = _movieResult.fold((MainFailure failure) {
        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramasMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          isError: true,
        );
      }, (HotAndNewResp resp) {
        final pastYear = resp.results;
        final trending = resp.results;
        final dramas = resp.results;
        final southIndian = resp.results;
        pastYear.shuffle();
        trending.shuffle();
        dramas.shuffle();
        southIndian.shuffle();
        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: pastYear,
          trendingMovieList: trending,
          tenseDramasMovieList: dramas,
          southIndianMovieList: southIndian,
          trendingTvList: state.trendingTvList,
          isLoading: false,
          isError: false,
        );
      });

      emit(stateOne);

      final stateTwo = _tvResult.fold((MainFailure failure) {
        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramasMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          isError: true,
        );
      }, (HotAndNewResp resp) {
        final topTenList = resp.results;
        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: state.pastYearMovieList,
          trendingMovieList: state.trendingMovieList,
          tenseDramasMovieList: state.tenseDramasMovieList,
          southIndianMovieList: state.southIndianMovieList,
          trendingTvList: topTenList,
          isLoading: false,
          isError: false,
        );
      });
      emit(stateTwo);
    });
  }
}
