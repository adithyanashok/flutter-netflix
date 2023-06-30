import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/core/main_failures.dart';
import 'package:netflix_app/domain/new_and_hot/model/hot_and_n_ew.dart';

abstract class HotAndNewSerice {
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovie();
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTv();
}
