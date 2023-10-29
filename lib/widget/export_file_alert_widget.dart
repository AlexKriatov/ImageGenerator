import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whimsy_games_preview_generator/state/root_cubit.dart';
import 'package:whimsy_games_preview_generator/state/root_state.dart';

class ExportDirectoryAlertWidget extends StatelessWidget {
  final Widget child;
  final TextEditingController exportPathController;
  final GlobalKey exportAlertKey;

  const ExportDirectoryAlertWidget(
      {super.key,
      required this.exportAlertKey,
      required this.child,
      required this.exportPathController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RootCubit, RootState>(listenWhen: (context, state) {
      return state.showExportAlert == true;
    }, listener: (context, state) {
      if (state.showExportAlert && exportAlertKey.currentWidget == null) {
        String fileName = '';
        Widget textField = TextField(onChanged: (value) {
          fileName = value;
        });
        Widget cancelButton = TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            context.read<RootCubit>().hideAlert();
            Navigator.of(context).pop();
          },
        );
        Widget continueButton = TextButton(
          child: const Text("Continue"),
          onPressed: () => context
              .read<RootCubit>()
              .saveFiles(fileName, exportPathController.text, context),
        );

        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return BlocBuilder<RootCubit, RootState>(
                  builder: (context, state) {
                return AlertDialog(
                  key: exportAlertKey,
                  title: Text(state.showExportProgress
                      ? "Exporting"
                      : "Enter file name"),
                  content: state.showExportProgress
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
                      : textField,
                  actions: [
                    if (!state.showExportProgress) cancelButton,
                    if (!state.showExportProgress) continueButton,
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
