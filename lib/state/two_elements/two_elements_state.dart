import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whimsy_games_preview_generator/model/preview_file.dart';

part 'two_elements_state.freezed.dart';

@freezed
class TwoElementsState with _$TwoElementsState {
  const factory TwoElementsState({
    @Default(null) ImageFile? image1,
    @Default(null) ImageFile? image2,
  }) = _TwoElementsState;
}
