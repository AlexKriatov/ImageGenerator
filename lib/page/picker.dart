import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whimsy_games_preview_generator/state/root_state.dart';
import 'package:whimsy_games_preview_generator/util/material_color_generator.dart';
import 'package:whimsy_games_preview_generator/widget/drop_content.dart';
import 'package:whimsy_games_preview_generator/widget/export_file_alert_widget.dart';
import 'package:whimsy_games_preview_generator/widget/import_directory_alert_widget.dart';
import 'package:file_selector/file_selector.dart';

import '../state/root_cubit.dart';

class PickerPage extends StatefulWidget {
  const PickerPage({super.key});

  @override
  State<StatefulWidget> createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {
  final _exportNameController = TextEditingController();
  final _exportPathController = TextEditingController();
  bool _isTextControllerInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadPrefsAndSetPath(context);
    });
  }

  void _loadPrefsAndSetPath(BuildContext context) {
    try {
      if (!_isTextControllerInitialized) {
        _isTextControllerInitialized = true;
        _initDocumentsDir(
            context.read<RootCubit>().prefs.getString('exportPath'));
        _initExportFileName(
            context.read<RootCubit>().prefs.getString('exportName'));
      }
    } catch (e) {
      print(e);
    }
  }

  void _initDocumentsDir(String? path) async {
    _exportPathController.value = TextEditingValue(
        text: path ?? (await getApplicationDocumentsDirectory()).path);
  }

  void _initExportFileName(String? name) async {
    _exportNameController.value = TextEditingValue(text: name ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final exportAlertKey = GlobalKey();
    final importAlertKey = GlobalKey();
    return BlocConsumer<RootCubit, RootState>(listenWhen: (context, state) {
      return state.showSnackBar == true ||
          state.showSnackBar == false ||
          state.finishExporting == true ||
          state.finishImporting == true;
    }, listener: (context, state) {
      if (state.finishExporting) {
        if (exportAlertKey.currentContext != null) {
          Navigator.of(exportAlertKey.currentContext!).pop();
        }
      }
      if (state.finishImporting) {
        if (importAlertKey.currentContext != null) {
          Navigator.of(importAlertKey.currentContext!).pop();
        }
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
      return ExportDirectoryAlertWidget(
        exportAlertKey: exportAlertKey,
        exportNameController: _exportNameController,
        exportPathController: _exportPathController,
        child: ImportDirectoryAlertWidget(
          importAlertKey: importAlertKey,
          child: Container(
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
                      MaterialButton(
                          color: MaterialColorGenerator.from(Colors.black),
                          textColor: Colors.white,
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('Choose'),
                          ),
                          onPressed: () async {
                            final path = await getDirectoryPath();
                            if (path != null) {
                              _exportPathController.value =
                                  TextEditingValue(text: path);
                            }
                          })
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
                                if (!state.showImportDirectoryAlert) {
                                  final file = detail.files.first;
                                  context.read<RootCubit>().setFile1(file);
                                }
                              },
                              child: DropContentWidget(file: state.image1),
                            ),
                            DropTarget(
                              onDragDone: (detail) {
                                if (!state.showImportDirectoryAlert) {
                                  final file = detail.files.first;
                                  context.read<RootCubit>().setFile2(file);
                                }
                              },
                              child: DropContentWidget(file: state.image2),
                            ),
                            DropTarget(
                              onDragDone: (detail) {
                                if (!state.showImportDirectoryAlert) {
                                  final file = detail.files.first;
                                  context.read<RootCubit>().setFile3(file);
                                }
                              },
                              child: DropContentWidget(file: state.image3),
                            ),
                            DropTarget(
                              onDragDone: (detail) {
                                if (!state.showImportDirectoryAlert) {
                                  final file = detail.files.first;
                                  context.read<RootCubit>().setFile4(file);
                                }
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
                                if (!state.showImportDirectoryAlert) {
                                  final file = detail.files.first;
                                  context.read<RootCubit>().setFile5(file);
                                }
                              },
                              child: DropContentWidget(file: state.image5),
                            ),
                            DropTarget(
                              onDragDone: (detail) {
                                if (!state.showImportDirectoryAlert) {
                                  final file = detail.files.first;
                                  context.read<RootCubit>().setFile6(file);
                                }
                              },
                              child: DropContentWidget(file: state.image6),
                            ),
                            DropTarget(
                              onDragDone: (detail) {
                                if (!state.showImportDirectoryAlert) {
                                  final file = detail.files.first;
                                  context.read<RootCubit>().setFile7(file);
                                }
                              },
                              child: DropContentWidget(file: state.image7),
                            ),
                            DropTarget(
                              onDragDone: (detail) {
                                if (!state.showImportDirectoryAlert) {
                                  final file = detail.files.first;
                                  context.read<RootCubit>().setFile8(file);
                                }
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
                                  context.read<RootCubit>().clearAllImages(),
                              color: MaterialColorGenerator.from(Colors.black),
                              textColor: Colors.white,
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text('Clear all'),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () => context
                                  .read<RootCubit>()
                                  .showImportDirectoryDialog(),
                              color: MaterialColorGenerator.from(Colors.black),
                              textColor: Colors.white,
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text('Import directory'),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () => context
                                  .read<RootCubit>()
                                  .tryToExportFile(_exportPathController.text),
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
          ),
        ),
      );
    });
  }
}
