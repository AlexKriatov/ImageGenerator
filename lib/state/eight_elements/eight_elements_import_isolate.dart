import 'dart:io';
import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:cross_file/cross_file.dart';
import 'package:whimsy_games_preview_generator/util/image_crop_util.dart';
import 'package:whimsy_games_preview_generator/util/io_util.dart';
import 'package:whimsy_games_preview_generator/util/platform_util.dart';

final ImageCropUtil _util = ImageCropUtil();

void loadDir8(List<Object> args) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(
      args[3] as RootIsolateToken);
  print('===isolate');
  final sendPort = args[0] as SendPort;
  final path = args[1] as String;
  final tempDir = Directory.fromUri(
          Uri.directory((args[2] as String), windows: isWindows()))
      .path;
  print(path);
  print(tempDir);
  final directory =
      Directory.fromUri(Uri.directory(path, windows: isWindows()));
  for (var element in directory.listSync()) {
    if (element.path.toLowerCase().endsWith('_1.png')) {
      final file1 = XFile(element.path);
      await prepareFileSilent(file1.path, file1.name, tempDir, 1, (image) {
        return _util.prepare8(image);
      });
    }
    if (element.path.toLowerCase().endsWith('_2.png')) {
      final file2 = XFile(element.path);
      await prepareFileSilent(file2.path, file2.name, tempDir, 2, (image) {
        return _util.prepare8(image);
      });
    }
    if (element.path.toLowerCase().endsWith('_3.png')) {
      final file3 = XFile(element.path);
      await prepareFileSilent(file3.path, file3.name, tempDir, 3, (image) {
        return _util.prepare8(image);
      });
    }
    if (element.path.toLowerCase().endsWith('_4.png')) {
      final file4 = XFile(element.path);
      await prepareFileSilent(file4.path, file4.name, tempDir, 4, (image) {
        return _util.prepare8(image);
      });
    }
    if (element.path.toLowerCase().endsWith('_5.png')) {
      final file5 = XFile(element.path);
      await prepareFileSilent(file5.path, file5.name, tempDir, 5, (image) {
        return _util.prepare8(image);
      });
    }
    if (element.path.toLowerCase().endsWith('_6.png')) {
      final file6 = XFile(element.path);
      await prepareFileSilent(file6.path, file6.name, tempDir, 6, (image) {
        return _util.prepare8(image);
      });
    }
    if (element.path.toLowerCase().endsWith('_7.png')) {
      final file7 = XFile(element.path);
      await prepareFileSilent(file7.path, file7.name, tempDir, 7, (image) {
        return _util.prepare8(image);
      });
    }
    if (element.path.toLowerCase().endsWith('_8.png')) {
      final file8 = XFile(element.path);
      await prepareFileSilent(file8.path, file8.name, tempDir, 8, (image) {
        return _util.prepare8(image);
      });
    }
  }
  sendPort.send('done');
}
