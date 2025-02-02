import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/file.txt");
  }

  Future<String> readFile() async {
    try {
      final file = await _localFile;
      return await file.readAsString();
    }
    catch(e) {
      return "";
    }
  }

  Future<File> writeFile(String contents) async {
    final file = await _localFile;
    return file.writeAsString(contents);
  }
}
