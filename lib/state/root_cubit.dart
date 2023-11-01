import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whimsy_games_preview_generator/model/preview_file.dart';
import 'package:whimsy_games_preview_generator/state/four_elements/four_elements_import_isolate.dart';
import 'package:whimsy_games_preview_generator/state/state_extensions.dart';
import 'package:whimsy_games_preview_generator/state/eight_elements/eight_elements_import_isolate.dart';
import 'package:whimsy_games_preview_generator/state/root_state.dart';
import 'package:whimsy_games_preview_generator/state/tab_state.dart';
import 'package:whimsy_games_preview_generator/state/two_elements/two_elements_import_isolate.dart';
import 'package:whimsy_games_preview_generator/util/image_crop_util.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whimsy_games_preview_generator/util/io_util.dart';
import 'package:whimsy_games_preview_generator/util/platform_util.dart';

class RootCubit extends Cubit<RootState> {
  late final SharedPreferences prefs;

  RootCubit() : super(RootState()) {
    _initPrefs();
  }

  final ImageCropUtil util = ImageCropUtil();

  void hideSnackbar() {
    emit(state.copyWith(showSnackBar: false, showSnackBarMsg: ''));
  }

  void hideAlert() {
    emit(state.copyWith(showExportAlert: false));
  }

  void switchTab(TabState tab) {
    print('switch tab $tab');
    emit(state.copyWith(tabState: tab));
  }

  void _setFile(XFile? file, int position) {
    emit(state.emitImageLoadingState(position));
    if (file != null) {
      delayed(
          action: () async =>
              emit(state.copyWithLoadedImage(await _prepareImage(file), position)));
    }
  }

  void setFile1(XFile? file) {
    if (_isFileCorrect(file)) {
      _setFile(file, 1);
    }
  }

  void setFile2(XFile? file) {
    if (_isFileCorrect(file)) {
      if (_isFileCorrect(file)) {
        _setFile(file, 2);
      }
    }
  }

  void setFile3(XFile? file) {
    if (_isFileCorrect(file)) {
      _setFile(file, 3);
    }
  }

  void setFile4(XFile? file) {
    if (_isFileCorrect(file)) {
      _setFile(file, 4);
    }
  }

  Future<ImageFile> _prepareImage(XFile file) async {
    return file.readAsBytes().then((value) {
      switch (state.tabState) {
        case TabState.two:
          return ImageFile(util.prepare2(value), file.name, false);
        case TabState.four:
          return ImageFile(util.prepare4(value), file.name, false);
        case TabState.eight:
          return ImageFile(util.prepare8(value), file.name, false);
      }
    });
  }

  void setFile5(XFile? file) {
    if (_isFileCorrect(file)) {
      _setFile(file, 5);
    }
  }

  void setFile6(XFile? file) {
    if (_isFileCorrect(file)) {
      _setFile(file, 6);
    }
  }

  void setFile7(XFile? file) {
    if (_isFileCorrect(file)) {
      _setFile(file, 7);
    }
  }

  void setFile8(XFile? file) {
    if (_isFileCorrect(file)) {
      _setFile(file, 8);
    }
  }

  void showImportDirectoryDialog() {
    emit(state.copyWith(
        showImportDirectoryAlert: true,
        showSnackBar: false,
        showSnackBarMsg: ''));
  }

  void hideImportDirectoryDialog() {
    emit(state.copyWith(
        showImportDirectoryProgress: false,
        showImportDirectoryAlert: false,
        showSnackBar: false,
        showSnackBarMsg: ''));
  }

  void tryImportDirectory(List<XFile> dir) async {
    if (dir.isEmpty || !_checkIsDirectory(dir)) {
      emit(state.copyWith(
          showSnackBar: true, showSnackBarMsg: 'File is not a directory.'));
      delayed(seconds: 2, action: () => hideSnackbar());
      return;
    }
    if (_checkIsDirectoryEmpty(dir)) {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg: 'Directory shouldn\'t be empty.'));
      delayed(seconds: 2, action: () => hideSnackbar());
      return;
    }
    print('importing');
    _importDirectory(dir);
  }

  void tryToExportFile(String path) {
    if (path.isEmpty || !Directory(path).existsSync()) {
      emit(state.copyWith(
          showSnackBar: true, showSnackBarMsg: 'Incorrect export path.'));
      delayed(seconds: 2, action: () => hideSnackbar());
      return;
    }
    switch (state.tabState) {
      case TabState.two:
        _tryToExportFile2(path);
        break;
      case TabState.four:
        _tryToExportFile4(path);
        break;
      case TabState.eight:
        _tryToExportFile8(path);
        break;
    }
  }

  void _tryToExportFile2(String path) {
    if (state.twoElementsState.image1?.bytes != null &&
        state.twoElementsState.image2?.bytes != null) {
      emit(state.copyWith(
          showExportAlert: true, showSnackBar: false, showSnackBarMsg: ''));
    } else {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg: 'Insert all required images, please'));
      delayed(seconds: 2, action: () => hideSnackbar());
    }
  }

  void _tryToExportFile4(String path) {
    if (state.fourElementsState.image1?.bytes != null &&
        state.fourElementsState.image2?.bytes != null &&
        state.fourElementsState.image3?.bytes != null &&
        state.fourElementsState.image4?.bytes != null) {
      emit(state.copyWith(
          showExportAlert: true, showSnackBar: false, showSnackBarMsg: ''));
    } else {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg: 'Insert all required images, please'));
      delayed(seconds: 2, action: () => hideSnackbar());
    }
  }

  void _tryToExportFile8(String path) {
    if (state.eightElementsState.image1?.bytes != null &&
        state.eightElementsState.image2?.bytes != null &&
        state.eightElementsState.image3?.bytes != null &&
        state.eightElementsState.image4?.bytes != null &&
        state.eightElementsState.image5?.bytes != null &&
        state.eightElementsState.image6?.bytes != null &&
        state.eightElementsState.image7?.bytes != null &&
        state.eightElementsState.image8?.bytes != null) {
      emit(state.copyWith(
          showExportAlert: true, showSnackBar: false, showSnackBarMsg: ''));
    } else {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg: 'Insert all required images, please'));
      delayed(seconds: 2, action: () => hideSnackbar());
    }
  }

  void saveFiles(String fileName, String path, BuildContext context) async {
    if (fileName.isNotEmpty) {
      emit(state.copyWith(
          showSnackBar: false, showSnackBarMsg: '', showExportProgress: true));
      prefs.setString('exportPath', path);
      prefs.setString('exportName', fileName);
      rootBundle.load('assets/images/background.png').then((background) async {
        var result;
        switch (state.tabState) {
          case TabState.eight:
            result = await util.mergeFinalImage8(
                fileName,
                path,
                background.buffer.asUint8List(),
                state.eightElementsState.image1!.bytes!,
                state.eightElementsState.image2!.bytes!,
                state.eightElementsState.image3!.bytes!,
                state.eightElementsState.image4!.bytes!,
                state.eightElementsState.image5!.bytes!,
                state.eightElementsState.image6!.bytes!,
                state.eightElementsState.image7!.bytes!,
                state.eightElementsState.image8!.bytes!);
            break;
          case TabState.four:
            result = await util.mergeFinalImage4(
                fileName,
                path,
                background.buffer.asUint8List(),
                state.fourElementsState.image1!.bytes!,
                state.fourElementsState.image2!.bytes!,
                state.fourElementsState.image3!.bytes!,
                state.fourElementsState.image4!.bytes!);
            break;
          case TabState.two:
            result = await util.mergeFinalImage2(
                fileName,
                path,
                background.buffer.asUint8List(),
                state.twoElementsState.image1!.bytes!,
                state.twoElementsState.image2!.bytes!);
            break;
        }
        emit(state.copyWith(
            showExportProgress: false,
            showExportAlert: false,
            finishExporting: true,
            showSnackBar: false,
            showSnackBarMsg: ''));
        delayed(action: () {
          emit(RootState(tabState: state.tabState));
          launchUrl(File(path).uri);
          launchUrl(result);
        });
      });
    } else {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg: 'File name shouldn\'t be empty.'));
      delayed(
          action: () =>
              emit(state.copyWith(showSnackBar: false, showSnackBarMsg: '')));
    }
  }

  void clearAllImages() {
    emit(state.clearAllImages());
  }

// Private api

  void _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    print(prefs.getString('exportName'));
    print(prefs.getString('exportPath'));
  }

  void _importDirectory(List<XFile> dir) async {
    emit(state.showImportingDirectoryProgress());
    final Completer completer = Completer();
    final tempDir = await getWhimpsyTempDir();
    delayed(action: () async {
      final dirPath = dir.first.path;
      var mainReceive = ReceivePort();
      var loadDir;
      if(state.tabState == TabState.two){
        loadDir = loadDir2;
      }
      if(state.tabState == TabState.four){
        loadDir = loadDir4;
      }
      if(state.tabState == TabState.eight){
        loadDir = loadDir8;
      }
      var isolate = await Isolate.spawn(
        loadDir,
        [mainReceive.sendPort, dirPath, tempDir, RootIsolateToken.instance!],
      );
      mainReceive.listen((message) {
        if (message == 'done') {
          mainReceive.close();
          completer.complete();
          isolate.kill();
        }
      });
      await completer.future;
      emit(await state.updateFromCache(tempDir));
      Directory(tempDir).deleteSync(recursive: true);
      emit(state.finishImport());
    });
  }

  bool _checkIsDirectoryEmpty(List<XFile> dir) {
    final list =
        Directory.fromUri(Uri.file(dir.first.path, windows: isWindows()))
            .listSync();
    return list.isEmpty;
  }

  bool _checkIsDirectory(List<XFile> dir) {
    try {
      Directory.fromUri(Uri.file(dir.first.path, windows: true)).listSync();
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  bool _isFileCorrect(XFile? file) {
    if (!(file?.name.split('.').last.toLowerCase().contains('png') ?? false)) {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg:
              'Unsupported file format. Insert png file instead.'));
      delayed(seconds: 2, action: () => hideSnackbar());
      return false;
    }
    return true;
  }

  void delayed({int seconds = 1, required Function() action}) async {
    await Future.delayed(Duration(seconds: seconds), () {
      action();
    });
  }
}
