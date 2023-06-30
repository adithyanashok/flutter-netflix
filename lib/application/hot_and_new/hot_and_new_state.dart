part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState(
      {required List<HotAndNewData> commingSoonList,
      required List<HotAndNewData> everyonIsWatchingList,
      required bool isLoading,
      required bool isError}) = _Initial;

  factory HotAndNewState.initial() => const HotAndNewState(
        commingSoonList: [],
        everyonIsWatchingList: [],
        isError: false,
        isLoading: false,
      );
}
