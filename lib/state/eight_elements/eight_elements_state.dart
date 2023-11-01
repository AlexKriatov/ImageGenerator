import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whimsy_games_preview_generator/model/preview_file.dart';

part 'eight_elements_state.freezed.dart';

@freezed
class EightElementsState with _$EightElementsState {
  const factory EightElementsState(
      {@Default(null) ImageFile? image1,
      @Default(null) ImageFile? image2,
      @Default(null) ImageFile? image3,
      @Default(null) ImageFile? image4,
      @Default(null) ImageFile? image5,
      @Default(null) ImageFile? image6,
      @Default(null) ImageFile? image7,
      @Default(null) ImageFile? image8,}) = _EightElementsState;
}
