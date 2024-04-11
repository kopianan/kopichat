import 'dart:io';
import 'package:file_picker/file_picker.dart';

class PickerHelper {
  static Future<File?> pickFiles(FileType fileType,
      {List<String>? extensions}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: extensions,
      type: (extensions == null || extensions.isEmpty)
          ? fileType
          : FileType.custom,
      allowCompression: true,
    );
    if (result != null) {
      print(result.xFiles.single.mimeType);
      final single = result.files.single;
      if (single.path == null) return null;

      return File(single.path!);
    }
    return null;
  }
}
