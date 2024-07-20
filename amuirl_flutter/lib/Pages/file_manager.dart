import 'dart:convert';
import 'dart:io';
import 'package:amuirl_flutter/Pages/game_map.dart';
import 'package:path_provider/path_provider.dart';


Future<String> get localPath async {
  final directory = await getApplicationDocumentsDirectory();
  
  return directory.path;
}

Future<File> getSaveFile(String name) async {
  final path = await localPath;
  Directory saveDir = Directory('$path/saveFile');
  var dirExist = await saveDir.exists();
  if (!dirExist) {
    saveDir = await saveDir.create();
  }

  return File('${saveDir.path}/$name.txt');
}

Future<File> writeSavedMap(GameMap map, String name) async {
  var file = await getSaveFile(name);

  return file.writeAsString(json.encode(map));
}

Future<GameMap> readSaveMap(String name) async {
  try {
    final file = await getSaveFile(name);

    final contents = await file.readAsString();
    return GameMap.fromJson(json.decode(contents));
  } catch (e) {
    print('fail');
    return GameMap(taskMarkerCoord: []);
  }
}

Future<void> deleteSaveMap(String name) async {
  final file = await getSaveFile(name);
  await file.delete();
}

List<String> recupAllFilesPath(String path) {
  int lengthPath = path.length + 1;
  List<String> allSaveFile = <String>[];
  var listOfFile = Directory(path).listSync();

  for (int i = 0; i < listOfFile.length; i++) {
    allSaveFile.add(
      listOfFile[i].path.substring(
        lengthPath,
        listOfFile[i].path.length - 4
      )
    );
  }

  return allSaveFile;
}