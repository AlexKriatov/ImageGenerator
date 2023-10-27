import 'dart:typed_data';

class ImageFile {
  final Uint8List? bytes;
  final String? name;
  final bool loading;

  ImageFile(this.bytes, this.name, this.loading);
}
