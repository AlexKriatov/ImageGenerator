import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whimsy_games_preview_generator/state/root_cubit.dart';
import 'package:whimsy_games_preview_generator/state/root_state.dart';
import 'package:whimsy_games_preview_generator/widget/drop_content.dart';

class TwoElementsPicker extends StatelessWidget {
  const TwoElementsPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DropTarget(
            onDragDone: (detail) {
              if (!state.showImportDirectoryAlert) {
                final file = detail.files.first;
                context.read<RootCubit>().setFile1(file);
              }
            },
            child: DropContentWidget(file: state.twoElementsState.image1),
          ),
          DropTarget(
            onDragDone: (detail) {
              if (!state.showImportDirectoryAlert) {
                final file = detail.files.first;
                context.read<RootCubit>().setFile2(file);
              }
            },
            child: DropContentWidget(file: state.twoElementsState.image2),
          ),
        ],
      );
    });
  }
}
