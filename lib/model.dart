import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState({
    @Default(1) int pageIndex,
    @Default([]) List<int> list,
  }) = _CounterState;
}
