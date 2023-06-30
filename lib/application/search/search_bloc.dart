import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/main_failures.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:netflix_app/domain/search/models/search_resp/search_resp.dart';
import 'package:netflix_app/domain/search/search_services.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsRepo;
  final SearchService _searchService;
  SearchBloc(this._downloadsRepo, this._searchService)
      : super(SearchState.initial()) {
    // Search Idle
    on<Initialize>((event, emit) async {
      if (state.idleResult.isNotEmpty) {
        emit(state);
        return;
      }
      emit(const SearchState(
        searchResultList: [],
        idleResult: [],
        isLoading: true,
        isError: false,
      ));
      final _result = await _downloadsRepo.getDownloadsImages();
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
          searchResultList: [],
          idleResult: [],
          isLoading: false,
          isError: true,
        );
      }, (List<Downloads> list) {
        return SearchState(
          searchResultList: [],
          idleResult: list,
          isLoading: false,
          isError: false,
        );
      });
      emit(_state);
    });

    // Search result
    on<SearchMovie>((event, emit) async {
      emit(const SearchState(
        searchResultList: [],
        idleResult: [],
        isLoading: true,
        isError: false,
      ));
      final _result =
          await _searchService.getSearchResult(searchQuery: event.searchQuery);
      final _state = _result.fold(
        (MainFailure failure) => const SearchState(
          searchResultList: [],
          idleResult: [],
          isLoading: false,
          isError: true,
        ),
        (SearchResp resp) => SearchState(
          searchResultList: resp.results,
          idleResult: [],
          isLoading: false,
          isError: false,
        ),
      );
      emit(_state);
    });
  }
}
