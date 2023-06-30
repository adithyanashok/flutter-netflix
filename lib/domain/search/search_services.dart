import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/core/main_failures.dart';
import 'package:netflix_app/domain/search/models/search_resp/search_resp.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchResp>> getSearchResult({
    required String searchQuery,
  });
}
