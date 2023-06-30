import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/core/main_failures.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
