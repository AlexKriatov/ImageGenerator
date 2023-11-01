import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whimsy_games_preview_generator/state/root_cubit.dart';
import 'package:whimsy_games_preview_generator/state/root_state.dart';
import 'package:whimsy_games_preview_generator/widget/drop_content.dart';

class ImportDirectoryAlertWidget extends StatelessWidget {
  final Widget child;
  final GlobalKey importAlertKey;

  const ImportDirectoryAlertWidget(
      {super.key, required this.importAlertKey, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RootCubit, RootState>(listenWhen: (context, state) {
      return state.showImportDirectoryAlert == true;
    }, listener: (context, state) {
      if (state.showImportDirectoryAlert &&
          importAlertKey.currentWidget == null) {
        Widget cancelButton = TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            context.read<RootCubit>().hideImportDirectoryDialog();
            Navigator.of(context).pop();
          },
        );
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return BlocBuilder<RootCubit, RootState>(
                  builder: (context, state) {
                return AlertDialog(
                  key: importAlertKey,
                  title: Text(state.showImportDirectoryProgress
                      ? "Importing"
                      : "Drop the directory into drop zone. Files names should be in format *_1-8.png"),
                  content: state.showImportDirectoryProgress
                      ? Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.all(5),
                          child: const Center(
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                              ),
                            ),
                          ),
                        )
                      : DropTarget(
                          onDragDone: (detail) {
                            context
                                .read<RootCubit>()
                                .tryImportDirectory(detail.files);
                          },
                          child: const DropContentWidget(file: null),
                        ),
                  actions: [
                    if (!state.showImportDirectoryProgress) cancelButton,
                  ],
                );
              });
            });
      }
    }, builder: (context, state) {
      return child;
    });
  }
}
