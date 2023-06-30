import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_failures.freezed.dart';

part 'main_failures.g.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.clientFailure() = _ClientFailure;

  const factory MainFailure.serverFailure() = _ServerFailure;

  factory MainFailure.fromJson(Map<String, dynamic> json) =>
      _$MainFailureFromJson(json);
}
