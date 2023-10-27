import 'package:flutter/material.dart';
import 'package:whimsy_games_preview_generator/model/preview_file.dart';

class DropContentWidget extends StatelessWidget {
  final ImageFile? file;

  const DropContentWidget({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100, width: 100, color: Colors.black26, child: _buildChild());
  }

  Widget _buildChild() {
    if (file?.bytes == null && (file?.loading ?? false)) {
      return const Center(child: CircularProgressIndicator());
    } else if (file?.bytes != null) {
      return Image.memory(file!.bytes!);
    }
    return const Center(child: Text("Drop here"));
  }
}
