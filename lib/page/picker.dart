import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whimsy_games_preview_generator/state/root_state.dart';
import 'package:whimsy_games_preview_generator/util/material_color_generator.dart';
import 'package:whimsy_games_preview_generator/widget/drop_content.dart';

import '../state/root_cubit.dart';

class PickerPage extends StatefulWidget {
  const PickerPage({super.key});

  @override
  State<StatefulWidget> createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {
  final _exportPathController = TextEditingController();

  @override
  void initState() {
    _initDocumentsDir();
    super.initState();
  }

  void _initDocumentsDir() async {
    _exportPathController.value =
        TextEditingValue(text: (await getApplicationDocumentsDirectory()).path);
  }

  @override
  Widget build(BuildContext context) {
    final alertKey = GlobalKey();
    return BlocConsumer<RootCubit, RootState>(listenWhen: (context, state) {
      return state.showSnackBar == true ||
          state.showSnackBar == false ||
          state.finishExporting == true;
    }, listener: (context, state) {
      if (state.finishExporting) {
        Navigator.of(alertKey.currentContext!).pop();
      }
      if (state.showSnackBar) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(state.showSnackBarMsg),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              context.read<RootCubit>().hideSnackbar();
            },
          ),
        ));
      }
    }, builder: (context, state) {
      return BlocConsumer<RootCubit, RootState>(
        listenWhen: (context, state) {
          return state.showExportAlert == true;
        },
        listener: (context, state) {
          if (state.showExportAlert && alertKey.currentWidget == null) {
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
              onPressed: () =>
                  context.read<RootCubit>().saveFiles(fileName, _exportPathController.text, context),
            );

            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return BlocBuilder<RootCubit, RootState>(
                      builder: (context, state) {
                    return AlertDialog(
                      key: alertKey,
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
        },
        builder: (context, state) {
          return Container(
            constraints: const BoxConstraints(
                minWidth: 1024, maxWidth: 1024, minHeight: 768, maxHeight: 768),
            child: Stack(
              children: [
                Image.asset('assets/images/background.png'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 10.0,
                        ),
                        child: Text(
                          "Export path:",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                            left: 10.0,
                          ),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            controller: _exportPathController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DropTarget(
                              onDragDone: (detail) {
                                final file = detail.files.first;
                                context.read<RootCubit>().setFile1(file);
                              },
                              child: DropContentWidget(file: state.image1),
                            ),
                            DropTarget(
                              onDragDone: (detail) {
                                final file = detail.files.first;
                                context.read<RootCubit>().setFile2(file);
                              },
                              child: DropContentWidget(file: state.image2),
                            ),
                            DropTarget(
                              onDragDone: (detail) {
                                final file = detail.files.first;
                                context.read<RootCubit>().setFile3(file);
                              },
                              child: DropContentWidget(file: state.image3),
                            ),
                            DropTarget(
                              onDragDone: (detail) {
                                final file = detail.files.first;
                                context.read<RootCubit>().setFile4(file);
                              },
                              child: DropContentWidget(file: state.image4),
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
                                final file = detail.files.first;
                                context.read<RootCubit>().setFile5(file);
                              },
                              child: DropContentWidget(file: state.image5),
                            ),
                            DropTarget(
                              onDragDone: (detail) {
                                final file = detail.files.first;
                                context.read<RootCubit>().setFile6(file);
                              },
                              child: DropContentWidget(file: state.image6),
                            ),
                            DropTarget(
                              onDragDone: (detail) {
                                final file = detail.files.first;
                                context.read<RootCubit>().setFile7(file);
                              },
                              child: DropContentWidget(file: state.image7),
                            ),
                            DropTarget(
                              onDragDone: (detail) {
                                final file = detail.files.first;
                                context.read<RootCubit>().setFile8(file);
                              },
                              child: DropContentWidget(file: state.image8),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                              onPressed: () =>
                                  context.read<RootCubit>().tryToExportFile(_exportPathController.text),
                              color: MaterialColorGenerator.from(Colors.black),
                              textColor: Colors.white,
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text('Export'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
