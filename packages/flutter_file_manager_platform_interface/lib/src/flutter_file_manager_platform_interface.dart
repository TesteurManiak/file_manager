library;

import 'dart:convert';
import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class FileManagerPlatform extends PlatformInterface {
  FileManagerPlatform() : super(token: _token);

  static FileManagerPlatform _instance = FileManagerPlatformException();

  static FileManagerPlatform get instance => _instance;

  static set instance(FileManagerPlatform value) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = value;
  }

  static final Object _token = Object();

  /// Write [data] inside [fileName] and return the path to the file.
  ///
  /// - `fileName`: The name of the file (e.g: `my_file.json`).
  /// - `data`: The data to write inside the file.
  ///
  /// This effectively encode the [data] to UTF-8 and perform a call to
  /// [writeFile].
  Future<String> writeFileAsString({
    required String fileName,
    required String data,
  }) {
    return writeFile(
      fileName: fileName,
      bytes: Uint8List.fromList(utf8.encode(data)),
    );
  }

  /// Write [bytes] inside [fileName] and return the path to the file.
  ///
  /// - `fileName`: The name of the file (e.g: `my_file.json`).
  /// - `bytes`: The data to write inside the file.
  Future<String> writeFile({
    required String fileName,
    required Uint8List bytes,
  }) {
    throw UnimplementedError('writeFile() has not been implemented.');
  }
}

class FileManagerPlatformException extends FileManagerPlatform {}
