import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whimsy_games_preview_generator/model/preview_file.dart';

part 'root_state.freezed.dart';

@freezed
class RootState with _$RootState {
  factory RootState(
      {@Default(null) ImageFile? image1,
      @Default(null) ImageFile? image2,
      @Default(null) ImageFile? image3,
      @Default(null) ImageFile? image4,
      @Default(null) ImageFile? image5,
      @Default(null) ImageFile? image6,
      @Default(null) ImageFile? image7,
      @Default(null) ImageFile? image8,
      @Default(false) bool showExportAlert,
      @Default(false) bool showExportProgress,
      @Default(false) bool showImportDirectoryAlert,
      @Default(false) bool showImportDirectoryProgress,
      @Default(false) bool finishImporting,
      @Default(false) bool showSnackBar,
      @Default(false) bool finishExporting,
      @Default('') String showSnackBarMsg}) = _RootState;
}
