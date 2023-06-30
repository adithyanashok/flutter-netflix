import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/main_failures.dart';
import 'package:netflix_app/domain/search/models/search_resp/search_resp.dart';
import 'package:netflix_app/domain/search/search_services.dart';
import 'package:netflix_app/infrastructure/core/api_end_points.dart';

@LazySingleton(as: SearchService)
class SearchRepository implements SearchService {
  @override
  Future<Either<MainFailure, SearchResp>> getSearchResult(
      {required String searchQuery}) async {
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.search, queryParameters: {'query': searchQuery});
      print(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e.toString());

      return const Left(MainFailure.clientFailure());
    }
  }
}
