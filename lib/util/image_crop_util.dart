import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';

class ImageCropUtil {

  Uint8List prepare8(Uint8List rawImage) {
    final image = img.PngDecoder().decode(rawImage);
    final crop = img.trim(image!, mode: TrimMode.transparent, sides: Trim.all);
    final result = img.copyResize(crop, height: 380, maintainAspect: true);
    return img.encodePng(result);
  }

  Uint8List prepare4(Uint8List rawImage) {
    final image = img.PngDecoder().decode(rawImage);
    final crop = img.trim(image!, mode: TrimMode.transparent, sides: Trim.all);
    final result = img.copyResize(crop, height: 540, width: 540, maintainAspect: true);
    return img.encodePng(result);
  }

  Uint8List prepare2(Uint8List rawImage) {
    final image = img.PngDecoder().decode(rawImage);
    final crop = img.trim(image!, mode: TrimMode.transparent, sides: Trim.all);
    final result = img.copyResize(crop, height: 800, maintainAspect: true);
    return img.encodePng(result);
  }

  Future<Uri> mergeFinalImage8(
      String fileName,
      String? filePath,
      Uint8List background,
      Uint8List image1,
      Uint8List image2,
      Uint8List image3,
      Uint8List image4,
      Uint8List image5,
      Uint8List image6,
      Uint8List image7,
      Uint8List image8) async {
    final directory = await getApplicationDocumentsDirectory();
    return await (img.Command()
          ..decodePng(background)
          ..compositeImage(Command()..decodePng(image1), dstX: 320, dstY: 280)
          ..compositeImage(Command()..decodePng(image2), dstX: 860, dstY: 280)
          ..compositeImage(Command()..decodePng(image3), dstX: 1380, dstY: 280)
          ..compositeImage(Command()..decodePng(image4), dstX: 1900, dstY: 280)
          ..compositeImage(Command()..decodePng(image5), dstX: 320, dstY: 700)
          ..compositeImage(Command()..decodePng(image6), dstX: 860, dstY: 700)
          ..compositeImage(Command()..decodePng(image7), dstX: 1380, dstY: 700)
          ..compositeImage(Command()..decodePng(image8), dstX: 1900, dstY: 700)
          ..encodeJpgFile(
              '${filePath ?? directory.path}${Platform.pathSeparator}$fileName.jpg'))
        .executeThread()
        .then((value) => File(
                '${filePath ?? directory.path}${Platform.pathSeparator}$fileName.jpg')
            .uri);
  }

  Future<Uri> mergeFinalImage4(
      String fileName,
      String? filePath,
      Uint8List background,
      Uint8List image1,
      Uint8List image2,
      Uint8List image3,
      Uint8List image4) async {
    final directory = await getApplicationDocumentsDirectory();
    return await (img.Command()
      ..decodePng(background)
      ..compositeImage(Command()..decodePng(image1), dstX: 80, dstY: 410)
      ..compositeImage(Command()..decodePng(image2), dstX: 700, dstY: 410)
      ..compositeImage(Command()..decodePng(image3), dstX: 1320, dstY: 410)
      ..compositeImage(Command()..decodePng(image4), dstX: 1940, dstY: 410)
      ..encodeJpgFile(
          '${filePath ?? directory.path}${Platform.pathSeparator}$fileName.jpg'))
        .executeThread()
        .then((value) => File(
        '${filePath ?? directory.path}${Platform.pathSeparator}$fileName.jpg')
        .uri);
  }

  Future<Uri> mergeFinalImage2(
      String fileName,
      String? filePath,
      Uint8List background,
      Uint8List image1,
      Uint8List image2,) async {
    final directory = await getApplicationDocumentsDirectory();
    return await (img.Command()
      ..decodePng(background)
      ..compositeImage(Command()..decodePng(image1), dstX: 320, dstY: 280)
      ..compositeImage(Command()..decodePng(image2), dstX: 1380, dstY: 280)
      ..encodeJpgFile(
          '${filePath ?? directory.path}${Platform.pathSeparator}$fileName.jpg'))
        .executeThread()
        .then((value) => File(
        '${filePath ?? directory.path}${Platform.pathSeparator}$fileName.jpg')
        .uri);
  }
}
