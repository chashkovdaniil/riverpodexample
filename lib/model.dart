import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState({
    required int counterValue,
  }) = _CounterState;
}
