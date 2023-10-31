import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whimsy_games_preview_generator/model/preview_file.dart';

Future<String> getWhimpsyTempDir() async =>
    '${(await getTemporaryDirectory()).path}${Platform.pathSeparator}WhimsyGamesReport${Platform.pathSeparator}${DateTime.now().millisecondsSinceEpoch}';

Future<ImageFile?> loadFromCache(String tempDir, int number) async {
  try {
    return ImageFile(
        await readFile('$tempDir${Platform.pathSeparator}$number.png'),
        '$number.png',
        false);
  } catch (e) {
    return null;
  }
}

Future<ImageFile?> prepareFileSilent(String path, String name, String tempDir,
    int position, Uint8List Function(Uint8List) prepare) async {
  return await readFile(path).then((value) async {
    if (value != null) {
      final file = prepare(value);
      await writeFile('$tempDir${Platform.pathSeparator}$position.png', file);
      return ImageFile(file, name, false);
    } else {
      return null;
    }
  });
}
