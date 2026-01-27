import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

Future<File> compressImage(File file) async {
final dir = await getApplicationDocumentsDirectory();
  final targetPath = "${dir.absolute.path}/${basename(file.path)}_compressed.jpg";

  var result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: 50, // جرب 50 أو 40
  );

  return File(result!.path);
}
