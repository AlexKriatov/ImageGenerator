import 'package:whimsy_games_preview_generator/model/preview_file.dart';
import 'package:whimsy_games_preview_generator/state/eight_elements/eight_elements_state.dart';
import 'package:whimsy_games_preview_generator/state/four_elements/four_elements_state.dart';
import 'package:whimsy_games_preview_generator/state/root_state.dart';
import 'package:whimsy_games_preview_generator/state/tab_state.dart';
import 'package:whimsy_games_preview_generator/state/two_elements/two_elements_state.dart';
import 'package:whimsy_games_preview_generator/util/io_util.dart';

extension RootStateExt on RootState {
  RootState emitImageLoadingState(int position) {
    switch (tabState) {
      case TabState.two:
        switch (position) {
          case 1:
            return copyWith(
                twoElementsState: twoElementsState.copyWith(
                    image1: ImageFile(null, null, true)));
          case 2:
            return copyWith(
                twoElementsState: twoElementsState.copyWith(
                    image2: ImageFile(null, null, true)));
          default:
            throw UnsupportedError(
                'Cannot show loading on undefined element position');
        }
      case TabState.four:
        switch (position) {
          case 1:
            return copyWith(
                fourElementsState: fourElementsState.copyWith(
                    image1: ImageFile(null, null, true)));
          case 2:
            return copyWith(
                fourElementsState: fourElementsState.copyWith(
                    image2: ImageFile(null, null, true)));
          case 3:
            return copyWith(
                fourElementsState: fourElementsState.copyWith(
                    image3: ImageFile(null, null, true)));
          case 4:
            return copyWith(
                fourElementsState: fourElementsState.copyWith(
                    image4: ImageFile(null, null, true)));
          default:
            throw UnsupportedError(
                'Cannot show loading on undefined element position');
        }
      case TabState.eight:
        switch (position) {
          case 1:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(
                    image1: ImageFile(null, null, true)));
          case 2:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(
                    image2: ImageFile(null, null, true)));
          case 3:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(
                    image3: ImageFile(null, null, true)));
          case 4:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(
                    image4: ImageFile(null, null, true)));
          case 5:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(
                    image5: ImageFile(null, null, true)));
          case 6:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(
                    image6: ImageFile(null, null, true)));
          case 7:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(
                    image7: ImageFile(null, null, true)));
          case 8:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(
                    image8: ImageFile(null, null, true)));
          default:
            throw UnsupportedError(
                'Cannot show loading on undefined element position');
        }
    }
  }

  RootState copyWithLoadedImage(ImageFile? file, int position) {
    switch (tabState) {
      case TabState.eight:
        switch (position) {
          case 1:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(image1: file),
                showSnackBar: false,
                showSnackBarMsg: '');
          case 2:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(image2: file),
                showSnackBar: false,
                showSnackBarMsg: '');
          case 3:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(image3: file),
                showSnackBar: false,
                showSnackBarMsg: '');
          case 4:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(image4: file),
                showSnackBar: false,
                showSnackBarMsg: '');
          case 5:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(image5: file),
                showSnackBar: false,
                showSnackBarMsg: '');
          case 6:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(image6: file),
                showSnackBar: false,
                showSnackBarMsg: '');
          case 7:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(image7: file),
                showSnackBar: false,
                showSnackBarMsg: '');
          case 8:
            return copyWith(
                eightElementsState: eightElementsState.copyWith(image8: file),
                showSnackBar: false,
                showSnackBarMsg: '');
          default:
            throw UnsupportedError('unsupported image position');
        }
      case TabState.four:
        switch (position) {
          case 1:
            return copyWith(
                fourElementsState: fourElementsState.copyWith(image1: file),
                showSnackBar: false,
                showSnackBarMsg: '');
          case 2:
            return copyWith(
                fourElementsState: fourElementsState.copyWith(image2: file),
                showSnackBar: false,
                showSnackBarMsg: '');
          case 3:
            return copyWith(
                fourElementsState: fourElementsState.copyWith(image3: file),
                showSnackBar: false,
                showSnackBarMsg: '');
          case 4:
            return copyWith(
                fourElementsState: fourElementsState.copyWith(image4: file),
                showSnackBar: false,
                showSnackBarMsg: '');
          default:
            throw UnsupportedError('unsupported image position');
        }
      case TabState.two:
        switch (position) {
          case 1:
            return copyWith(
                twoElementsState: twoElementsState.copyWith(image1: file),
                showSnackBar: false,
                showSnackBarMsg: '');
          case 2:
            return copyWith(
                twoElementsState: twoElementsState.copyWith(image2: file),
                showSnackBar: false,
                showSnackBarMsg: '');
          default:
            throw UnsupportedError('unsupported image position');
        }
    }
  }

  RootState showImportingDirectoryProgress() {
    return copyWith(
        showImportDirectoryProgress: true,
        showSnackBar: false,
        showSnackBarMsg: '');
  }

  Future<RootState> updateFromCache(String tempDir) async {
    switch (tabState) {
      case TabState.eight:
        return copyWith(
            showImportDirectoryProgress: false,
            showImportDirectoryAlert: false,
            finishImporting: true,
            eightElementsState: eightElementsState.copyWith(
              image1: await loadFromCache(tempDir, 1),
              image2: await loadFromCache(tempDir, 2),
              image3: await loadFromCache(tempDir, 3),
              image4: await loadFromCache(tempDir, 4),
              image5: await loadFromCache(tempDir, 5),
              image6: await loadFromCache(tempDir, 6),
              image7: await loadFromCache(tempDir, 7),
              image8: await loadFromCache(tempDir, 8),
            ),
            showSnackBar: false,
            showSnackBarMsg: '');
      case TabState.four:
        return copyWith(
            showImportDirectoryProgress: false,
            showImportDirectoryAlert: false,
            finishImporting: true,
            fourElementsState: fourElementsState.copyWith(
              image1: await loadFromCache(tempDir, 1),
              image2: await loadFromCache(tempDir, 2),
              image3: await loadFromCache(tempDir, 3),
              image4: await loadFromCache(tempDir, 4),
            ),
            showSnackBar: false,
            showSnackBarMsg: '');
      case TabState.two:
        return copyWith(
            showImportDirectoryProgress: false,
            showImportDirectoryAlert: false,
            finishImporting: true,
            twoElementsState: twoElementsState.copyWith(
              image1: await loadFromCache(tempDir, 1),
              image2: await loadFromCache(tempDir, 2),
            ),
            showSnackBar: false,
            showSnackBarMsg: '');
    }
  }

  RootState finishImport() {
    return copyWith(
      finishImporting: false,
    );
  }

  RootState clearAllImages() {
    switch (tabState) {
      case TabState.eight:
        return copyWith(
          eightElementsState: const EightElementsState(),
        );
      case TabState.four:
        return copyWith(
          fourElementsState: const FourElementsState(),
        );
      case TabState.two:
        return copyWith(
          twoElementsState: const TwoElementsState(),
        );
    }
  }
}
