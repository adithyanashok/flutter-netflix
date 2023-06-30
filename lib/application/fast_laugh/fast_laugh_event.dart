part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initialize() = Initialize;
  const factory FastLaughEvent.like({
    required int id,
  }) = Like;
  const factory FastLaughEvent.unLike({
    required int id,
  }) = UnLike;
}
