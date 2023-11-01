import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whimsy_games_preview_generator/state/root_cubit.dart';
import 'package:whimsy_games_preview_generator/state/root_state.dart';
import 'package:whimsy_games_preview_generator/widget/drop_content.dart';

class EightElementsPicker extends StatelessWidget {
  const EightElementsPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(builder: (context, state) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropTarget(
                  onDragDone: (detail) {
                    if (!state.showImportDirectoryAlert) {
                      final file = detail.files.first;
                      context.read<RootCubit>().setFile1(file);
                    }
                  },
                  child:
                      DropContentWidget(file: state.eightElementsState.image1),
                ),
                DropTarget(
                  onDragDone: (detail) {
                    if (!state.showImportDirectoryAlert) {
                      final file = detail.files.first;
                      context.read<RootCubit>().setFile2(file);
                    }
                  },
                  child:
                      DropContentWidget(file: state.eightElementsState.image2),
                ),
                DropTarget(
                  onDragDone: (detail) {
                    if (!state.showImportDirectoryAlert) {
                      final file = detail.files.first;
                      context.read<RootCubit>().setFile3(file);
                    }
                  },
                  child:
                      DropContentWidget(file: state.eightElementsState.image3),
                ),
                DropTarget(
                  onDragDone: (detail) {
                    if (!state.showImportDirectoryAlert) {
                      final file = detail.files.first;
                      context.read<RootCubit>().setFile4(file);
                    }
                  },
                  child:
                      DropContentWidget(file: state.eightElementsState.image4),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropTarget(
                  onDragDone: (detail) {
                    if (!state.showImportDirectoryAlert) {
                      final file = detail.files.first;
                      context.read<RootCubit>().setFile5(file);
                    }
                  },
                  child:
                      DropContentWidget(file: state.eightElementsState.image5),
                ),
                DropTarget(
                  onDragDone: (detail) {
                    if (!state.showImportDirectoryAlert) {
                      final file = detail.files.first;
                      context.read<RootCubit>().setFile6(file);
                    }
                  },
                  child:
                      DropContentWidget(file: state.eightElementsState.image6),
                ),
                DropTarget(
                  onDragDone: (detail) {
                    if (!state.showImportDirectoryAlert) {
                      final file = detail.files.first;
                      context.read<RootCubit>().setFile7(file);
                    }
                  },
                  child:
                      DropContentWidget(file: state.eightElementsState.image7),
                ),
                DropTarget(
                  onDragDone: (detail) {
                    if (!state.showImportDirectoryAlert) {
                      final file = detail.files.first;
                      context.read<RootCubit>().setFile8(file);
                    }
                  },
                  child:
                      DropContentWidget(file: state.eightElementsState.image8),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
