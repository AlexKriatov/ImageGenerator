import 'dart:io';
import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:cross_file/cross_file.dart';
import 'package:whimsy_games_preview_generator/util/image_crop_util.dart';
import 'package:whimsy_games_preview_generator/util/io_util.dart';
import 'package:whimsy_games_preview_generator/util/platform_util.dart';

final ImageCropUtil _util = ImageCropUtil();

void loadDir2(List<Object> args) async {
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
        return _util.prepare2(image);
      });
    }
    if (element.path.toLowerCase().endsWith('_2.png')) {
      final file2 = XFile(element.path);
      await prepareFileSilent(file2.path, file2.name, tempDir, 2, (image) {
        return _util.prepare2(image);
      });
    }
  }
  sendPort.send('done');
}
