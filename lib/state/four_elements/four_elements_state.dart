import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whimsy_games_preview_generator/model/preview_file.dart';

part 'four_elements_state.freezed.dart';

@freezed
class FourElementsState with _$FourElementsState {
  const factory FourElementsState(
      {@Default(null) ImageFile? image1,
        @Default(null) ImageFile? image2,
        @Default(null) ImageFile? image3,
        @Default(null) ImageFile? image4,}) = _FourElementsState;
}
