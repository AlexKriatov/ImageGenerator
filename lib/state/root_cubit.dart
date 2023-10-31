import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whimsy_games_preview_generator/model/preview_file.dart';
import 'package:whimsy_games_preview_generator/state/extensions.dart';
import 'package:whimsy_games_preview_generator/state/root_state.dart';
import 'package:whimsy_games_preview_generator/state/root_state_isolate.dart';
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

  void setFile1(XFile? file) {
    if (_isFileCorrect(file)) {
      emit(state.copyWith(image1: ImageFile(null, null, true)));
      if (file != null) {
        delayed(
            action: () async =>
                emit(state.copyWithLoadedImage(await _prepareImage(file), 1)));
      }
    }
  }

  void setFile2(XFile? file) {
    if (_isFileCorrect(file)) {
      emit(state.copyWith(image2: ImageFile(null, null, true)));
      if (file != null) {
        delayed(
            action: () async =>
                emit(state.copyWithLoadedImage(await _prepareImage(file), 2)));
      }
    }
  }

  void setFile3(XFile? file) {
    if (_isFileCorrect(file)) {
      emit(state.copyWith(image3: ImageFile(null, null, true)));
      if (file != null) {
        delayed(
            action: () async =>
                emit(state.copyWithLoadedImage(await _prepareImage(file), 3)));
      }
    }
  }

  void setFile4(XFile? file) {
    if (_isFileCorrect(file)) {
      emit(state.copyWith(image4: ImageFile(null, null, true)));
      if (file != null) {
        delayed(
            action: () async =>
                emit(state.copyWithLoadedImage(await _prepareImage(file), 4)));
      }
    }
  }

  Future<ImageFile> _prepareImage(XFile file) async {
    return file.readAsBytes().then((value) {
      return ImageFile(util.prepare(value), file.name, false);
    });
  }

  void delayed({int seconds = 1, required Function() action}) async {
    await Future.delayed(Duration(seconds: seconds), () {
      action();
    });
  }

  void setFile5(XFile? file) {
    if (_isFileCorrect(file)) {
      emit(state.copyWith(image5: ImageFile(null, null, true)));
      if (file != null) {
        delayed(
            action: () async =>
                emit(state.copyWithLoadedImage(await _prepareImage(file), 5)));
      }
    }
  }

  void setFile6(XFile? file) {
    if (_isFileCorrect(file)) {
      emit(state.copyWith(image6: ImageFile(null, null, true)));
      if (file != null) {
        delayed(
            action: () async =>
                emit(state.copyWithLoadedImage(await _prepareImage(file), 6)));
      }
    }
  }

  void setFile7(XFile? file) {
    if (_isFileCorrect(file)) {
      emit(state.copyWith(image7: ImageFile(null, null, true)));
      if (file != null) {
        delayed(
            action: () async =>
                emit(state.copyWithLoadedImage(await _prepareImage(file), 7)));
      }
    }
  }

  void setFile8(XFile? file) {
    if (_isFileCorrect(file)) {
      emit(state.copyWith(image8: ImageFile(null, null, true)));
      if (file != null) {
        delayed(
            action: () async =>
                emit(state.copyWithLoadedImage(await _prepareImage(file), 8)));
      }
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
    if (state.image1?.bytes != null &&
        state.image2?.bytes != null &&
        state.image3?.bytes != null &&
        state.image4?.bytes != null &&
        state.image5?.bytes != null &&
        state.image6?.bytes != null &&
        state.image7?.bytes != null &&
        state.image8?.bytes != null) {
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
        final result = await util.mergeFinalImage(
            fileName,
            path,
            background.buffer.asUint8List(),
            state.image1!.bytes!,
            state.image2!.bytes!,
            state.image3!.bytes!,
            state.image4!.bytes!,
            state.image5!.bytes!,
            state.image6!.bytes!,
            state.image7!.bytes!,
            state.image8!.bytes!);
        emit(state.copyWith(
            showExportProgress: false,
            showExportAlert: false,
            finishExporting: true,
            showSnackBar: false,
            showSnackBarMsg: ''));
        delayed(action: () {
          emit(RootState());
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

  void _importDirectory(List<XFile> dir) async {
    emit(state.showImportingDirectoryProgress());
    final Completer completer = Completer();
    final tempDir = await getWhimpsyTempDir();
    delayed(action: () async {
      final dirPath = dir.first.path;
      var mainReceive = ReceivePort();
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
}
