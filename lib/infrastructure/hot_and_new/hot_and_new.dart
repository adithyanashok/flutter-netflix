import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/main_failures.dart';
import 'package:netflix_app/domain/new_and_hot/model/hot_and_n_ew.dart';
import 'package:netflix_app/domain/new_and_hot/new_and_hot_service.dart';
import 'package:netflix_app/infrastructure/core/api_end_points.dart';

@LazySingleton(as: HotAndNewSerice)
class HotAndNewImplements implements HotAndNewSerice {
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovie() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.newAndHotMovies);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTv() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.newAndHotTv);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
