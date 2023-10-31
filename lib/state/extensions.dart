import 'package:whimsy_games_preview_generator/model/preview_file.dart';
import 'package:whimsy_games_preview_generator/state/root_state.dart';
import 'package:whimsy_games_preview_generator/util/io_util.dart';

extension RootStateExt on RootState {
  RootState copyWithLoadedImage(ImageFile? file, int position) {
    switch (position) {
      case 1:
        return copyWith(image1: file, showSnackBar: false, showSnackBarMsg: '');
      case 2:
        return copyWith(image2: file, showSnackBar: false, showSnackBarMsg: '');
      case 3:
        return copyWith(image3: file, showSnackBar: false, showSnackBarMsg: '');
      case 4:
        return copyWith(image4: file, showSnackBar: false, showSnackBarMsg: '');
      case 5:
        return copyWith(image5: file, showSnackBar: false, showSnackBarMsg: '');
      case 6:
        return copyWith(image6: file, showSnackBar: false, showSnackBarMsg: '');
      case 7:
        return copyWith(image7: file, showSnackBar: false, showSnackBarMsg: '');
      case 8:
        return copyWith(image8: file, showSnackBar: false, showSnackBarMsg: '');
      default:
        throw UnsupportedError('unsupported image position');
    }
  }

  RootState showImportingDirectoryProgress() {
    return copyWith(
        showImportDirectoryProgress: true,
        showSnackBar: false,
        showSnackBarMsg: '');
  }

  Future<RootState> updateFromCache(String tempDir) async {
    return copyWith(
        showImportDirectoryProgress: false,
        showImportDirectoryAlert: false,
        finishImporting: true,
        image1: await loadFromCache(tempDir, 1),
        image2: await loadFromCache(tempDir, 2),
        image3: await loadFromCache(tempDir, 3),
        image4: await loadFromCache(tempDir, 4),
        image5: await loadFromCache(tempDir, 5),
        image6: await loadFromCache(tempDir, 6),
        image7: await loadFromCache(tempDir, 7),
        image8: await loadFromCache(tempDir, 8),
        showSnackBar: false,
        showSnackBarMsg: '');
  }

  RootState finishImport() {
    return copyWith(
      finishImporting: false,
    );
  }

  RootState clearAllImages() {
    return copyWith(
      image1: null,
      image2: null,
      image3: null,
      image4: null,
      image5: null,
      image6: null,
      image7: null,
      image8: null,
    );
  }
}
