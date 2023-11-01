import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whimsy_games_preview_generator/state/eight_elements/eight_elements_state.dart';
import 'package:whimsy_games_preview_generator/state/four_elements/four_elements_state.dart';
import 'package:whimsy_games_preview_generator/state/tab_state.dart';
import 'package:whimsy_games_preview_generator/state/two_elements/two_elements_state.dart';

part 'root_state.freezed.dart';

@freezed
class RootState with _$RootState {

  factory RootState(
      {@Default(TabState.eight) TabState tabState,
      @Default(EightElementsState()) EightElementsState eightElementsState,
      @Default(FourElementsState()) FourElementsState fourElementsState,
      @Default(TwoElementsState()) TwoElementsState twoElementsState,
      @Default(false) bool showExportAlert,
      @Default(false) bool showExportProgress,
      @Default(false) bool showImportDirectoryAlert,
      @Default(false) bool showImportDirectoryProgress,
      @Default(false) bool finishImporting,
      @Default(false) bool showSnackBar,
      @Default(false) bool finishExporting,
      @Default('') String showSnackBarMsg}) = _RootState;
}
