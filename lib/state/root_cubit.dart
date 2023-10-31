import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whimsy_games_preview_generator/model/preview_file.dart';
import 'package:whimsy_games_preview_generator/state/root_state.dart';
import 'package:whimsy_games_preview_generator/util/image_crop_util.dart';
import 'package:url_launcher/url_launcher.dart';

class RootCubit extends Cubit<RootState> {
  late final SharedPreferences prefs;

  RootCubit() : super(RootState()) {
    _initPrefs();
  }

  void _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  final ImageCropUtil util = ImageCropUtil();

  void hideSnackbar() {
    emit(state.copyWith(showSnackBar: false, showSnackBarMsg: ''));
  }

  void hideAlert() {
    emit(state.copyWith(showExportAlert: false));
  }

  void setFile1(XFile? file) {
    if (!(file?.name.split('.').last.toLowerCase().contains('png') ?? false)) {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg:
              'Unsupported file format. Insert png file instead.'));
      Future.delayed(const Duration(seconds: 2), () => hideSnackbar());
      return;
    }
    emit(state.copyWith(image1: ImageFile(null, null, true)));
    if (file != null) {
      file.readAsBytes().then((value) {
        Future.delayed(const Duration(seconds: 1), () {
          emit(state.copyWith(
              image1: ImageFile(util.prepare(value), file.name, false),
              showSnackBar: false,
              showSnackBarMsg: ''));
        });
      });
    }
  }

  void setFile2(XFile? file) {
    if (!(file?.name.split('.').last.toLowerCase().contains('png') ?? false)) {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg:
              'Unsupported file format. Insert png file instead.'));
      Future.delayed(const Duration(seconds: 2), () => hideSnackbar());
      return;
    }
    emit(state.copyWith(image2: ImageFile(null, null, true)));
    if (file != null) {
      file.readAsBytes().then((value) {
        Future.delayed(const Duration(seconds: 1), () {
          emit(state.copyWith(
              image2: ImageFile(util.prepare(value), file.name, false),
              showSnackBar: false,
              showSnackBarMsg: ''));
        });
      });
    }
  }

  void setFile3(XFile? file) {
    if (!(file?.name.split('.').last.toLowerCase().contains('png') ?? false)) {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg:
              'Unsupported file format. Insert png file instead.'));
      Future.delayed(const Duration(seconds: 2), () => hideSnackbar());
      return;
    }
    emit(state.copyWith(image3: ImageFile(null, null, true)));
    if (file != null) {
      file.readAsBytes().then((value) {
        Future.delayed(const Duration(seconds: 1), () {
          emit(state.copyWith(
              image3: ImageFile(util.prepare(value), file.name, false),
              showSnackBar: false,
              showSnackBarMsg: ''));
        });
      });
    }
  }

  void setFile4(XFile? file) {
    if (!(file?.name.split('.').last.toLowerCase().contains('png') ?? false)) {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg:
              'Unsupported file format. Insert png file instead.'));
      Future.delayed(const Duration(seconds: 2), () => hideSnackbar());
      return;
    }
    emit(state.copyWith(image4: ImageFile(null, null, true)));
    if (file != null) {
      file.readAsBytes().then((value) {
        Future.delayed(const Duration(seconds: 1), () {
          emit(state.copyWith(
              image4: ImageFile(util.prepare(value), file.name, false),
              showSnackBar: false,
              showSnackBarMsg: ''));
        });
      });
    }
  }

  void setFile5(XFile? file) {
    if (!(file?.name.split('.').last.toLowerCase().contains('png') ?? false)) {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg:
              'Unsupported file format. Insert png file instead.'));
      Future.delayed(const Duration(seconds: 2), () => hideSnackbar());
      return;
    }
    emit(state.copyWith(image5: ImageFile(null, null, true)));
    if (file != null) {
      file.readAsBytes().then((value) {
        Future.delayed(const Duration(seconds: 1), () {
          emit(state.copyWith(
              image5: ImageFile(util.prepare(value), file.name, false),
              showSnackBar: false,
              showSnackBarMsg: ''));
        });
      });
    }
  }

  void setFile6(XFile? file) {
    if (!(file?.name.split('.').last.toLowerCase().contains('png') ?? false)) {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg:
              'Unsupported file format. Insert png file instead.'));
      Future.delayed(const Duration(seconds: 2), () => hideSnackbar());
      return;
    }
    emit(state.copyWith(image6: ImageFile(null, null, true)));
    if (file != null) {
      file.readAsBytes().then((value) {
        Future.delayed(const Duration(seconds: 1), () {
          emit(state.copyWith(
              image6: ImageFile(util.prepare(value), file.name, false),
              showSnackBar: false,
              showSnackBarMsg: ''));
        });
      });
    }
  }

  void setFile7(XFile? file) {
    if (!(file?.name.split('.').last.toLowerCase().contains('png') ?? false)) {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg:
              'Unsupported file format. Insert png file instead.'));
      Future.delayed(const Duration(seconds: 2), () => hideSnackbar());
      return;
    }
    emit(state.copyWith(image7: ImageFile(null, null, true)));
    if (file != null) {
      file.readAsBytes().then((value) {
        Future.delayed(const Duration(seconds: 1), () {
          emit(state.copyWith(
              image7: ImageFile(util.prepare(value), file.name, false),
              showSnackBar: false,
              showSnackBarMsg: ''));
        });
      });
    }
  }

  void setFile8(XFile? file) {
    if (!(file?.name.split('.').last.toLowerCase().contains('png') ?? false)) {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg:
              'Unsupported file format. Insert png file instead.'));
      Future.delayed(const Duration(seconds: 2), () => hideSnackbar());
      return;
    }
    emit(state.copyWith(image8: ImageFile(null, null, true)));
    if (file != null) {
      file.readAsBytes().then((value) {
        Future.delayed(const Duration(seconds: 1), () {
          emit(state.copyWith(
              image8: ImageFile(util.prepare(value), file.name, false),
              showSnackBar: false,
              showSnackBarMsg: ''));
        });
      });
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
          showSnackBar: true,
          showSnackBarMsg: 'File is not a directory.'));
      Future.delayed(const Duration(seconds: 2), () => hideSnackbar());
      return;
    }
    if (_checkIsDirectoryEmpty(dir)) {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg: 'Directory shouldn\'t be empty.'));
      Future.delayed(const Duration(seconds: 2), () => hideSnackbar());
      return;
    }
    print('importing');
    _importDirectory(dir);
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

  bool _checkIsDirectoryEmpty(List<XFile> dir) {
    final list =
        Directory.fromUri(Uri.file(dir.first.path, windows: true)).listSync();
    return list.isEmpty;
  }

  Future<ImageFile?> _loadFromCache(String tempDir, int number) async {
    try {
      return ImageFile(
          await readFile('$tempDir${Platform.pathSeparator}$number.png'),
          '$number.png',
          false);}
    catch(e){
      return null;
    }
  }

  void _importDirectory(List<XFile> dir) async {
    emit(state.copyWith(
        showImportDirectoryProgress: true,
        showSnackBar: false,
        showSnackBarMsg: ''));
    final Completer completer = Completer();
    final appDir = await getTemporaryDirectory();
    final tempDir =
        '${appDir.path}${Platform.pathSeparator}WhimsyGamesReport${Platform.pathSeparator}${DateTime.now().millisecondsSinceEpoch}';
    await Future.delayed(const Duration(seconds: 1), () async {
      final dirPath = dir.first.path;
      var mainReceive = ReceivePort();
      var isolate = await Isolate.spawn(
        _loadDir,
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
      emit(state.copyWith(
          showImportDirectoryProgress: false,
          showImportDirectoryAlert: false,
          finishImporting: true,
          image1: await _loadFromCache(tempDir, 1),
          image2: await _loadFromCache(tempDir, 2),
          image3: await _loadFromCache(tempDir, 3),
          image4: await _loadFromCache(tempDir, 4),
          image5: await _loadFromCache(tempDir, 5),
          image6: await _loadFromCache(tempDir, 6),
          image7: await _loadFromCache(tempDir, 7),
          image8: await _loadFromCache(tempDir, 8),
          showSnackBar: false,
          showSnackBarMsg: ''));
      Directory(tempDir).deleteSync(recursive: true);
      emit(state.copyWith(
        finishImporting: false,
      ));
    });
  }

  void tryToExportFile(String path) {
    if (path.isEmpty || !Directory(path).existsSync()) {
      emit(state.copyWith(
          showSnackBar: true, showSnackBarMsg: 'Incorrect export path.'));
      Future.delayed(const Duration(seconds: 2), () => hideSnackbar());
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
        Future.delayed(const Duration(seconds: 1), () async {
          emit(RootState());
          launchUrl(File(path).uri);
          launchUrl(result);
        });
      });
    } else {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg: 'File name shouldn\'t be empty.'));
    }
  }

  void clearAllImages() {
    emit(state.copyWith(
      image1: null,
      image2: null,
      image3: null,
      image4: null,
      image5: null,
      image6: null,
      image7: null,
      image8: null,
    ));
  }
}

final ImageCropUtil _util = ImageCropUtil();

Future<ImageFile>? _getFileSilent(FileSystemEntity file) async {
  final xFile = XFile(file.path);
  return await xFile.readAsBytes().then((value) {
    return ImageFile(_util.prepare(value), xFile.name, false);
  });
}

void _loadDir(List<Object> args) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(
      args[3] as RootIsolateToken);
  print('===isolate');
  final sendPort = args[0] as SendPort;
  final path = args[1] as String;
  final tempDir =
      Directory.fromUri(Uri.directory((args[2] as String), windows: true)).path;
  print(path);
  print(tempDir);
  final directory = Directory.fromUri(Uri.directory(path, windows: true));
  for (var element in directory.listSync()) {
    if (element.path.toLowerCase().endsWith('_1.png')) {
      final file1 = await _getFileSilent(element);
      await writeFile('$tempDir${Platform.pathSeparator}1.png', file1!.bytes!);
    }
    if (element.path.toLowerCase().endsWith('_2.png')) {
      final file2 = await _getFileSilent(element);
      await writeFile('$tempDir${Platform.pathSeparator}2.png', file2!.bytes!);
    }
    if (element.path.toLowerCase().endsWith('_3.png')) {
      final file3 = await _getFileSilent(element);
      await writeFile('$tempDir${Platform.pathSeparator}3.png', file3!.bytes!);
    }
    if (element.path.toLowerCase().endsWith('_4.png')) {
      final file4 = await _getFileSilent(element);
      await writeFile('$tempDir${Platform.pathSeparator}4.png', file4!.bytes!);
    }
    if (element.path.toLowerCase().endsWith('_5.png')) {
      final file5 = await _getFileSilent(element);
      await writeFile('$tempDir${Platform.pathSeparator}5.png', file5!.bytes!);
    }
    if (element.path.toLowerCase().endsWith('_6.png')) {
      final file6 = await _getFileSilent(element);
      await writeFile('$tempDir${Platform.pathSeparator}6.png', file6!.bytes!);
    }
    if (element.path.toLowerCase().endsWith('_7.png')) {
      final file7 = await _getFileSilent(element);
      await writeFile('$tempDir${Platform.pathSeparator}7.png', file7!.bytes!);
    }
    if (element.path.toLowerCase().endsWith('_8.png')) {
      final file8 = await _getFileSilent(element);
      await writeFile('$tempDir${Platform.pathSeparator}8.png', file8!.bytes!);
    }
  }
  sendPort.send('done');
}
