import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whimsy_games_preview_generator/model/preview_file.dart';
import 'package:whimsy_games_preview_generator/state/root_state.dart';
import 'package:whimsy_games_preview_generator/util/image_crop_util.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit() : super(RootState());
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
              image1: ImageFile(util.prepare(value), file.name, false)));
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
              image2: ImageFile(util.prepare(value), file.name, false)));
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
              image3: ImageFile(util.prepare(value), file.name, false)));
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
              image4: ImageFile(util.prepare(value), file.name, false)));
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
              image5: ImageFile(util.prepare(value), file.name, false)));
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
              image6: ImageFile(util.prepare(value), file.name, false)));
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
              image7: ImageFile(util.prepare(value), file.name, false)));
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
              image8: ImageFile(util.prepare(value), file.name, false)));
        });
      });
    }
  }

  Future<String?> pickFolder(BuildContext context) async {
    return await FilesystemPicker.open(
      title: 'Save to folder',
      context: context,
      requestPermission: () => Permission.storage.status.isGranted,
      rootDirectory: (await getExternalStorageDirectories())?.first,
      fsType: FilesystemType.folder,
      pickText: 'Save file to this folder',
    );
  }

  void tryToExportFile(String path) {
    if (path.isEmpty || !Directory(path).existsSync()) {
      emit(state.copyWith(
          showSnackBar: true,
          showSnackBarMsg:
              'Incorrect export path.'));
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
      emit(state.copyWith(showExportAlert: true));
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
            finishExporting: true));
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
}
