import 'package:amuirl_client/amuirl_client.dart';
import 'package:amuirl_flutter/Pages/Widget/GameCreation/game_settings.dart';
import 'package:amuirl_flutter/Pages/Widget/GameCreation/load_interface.dart';
import 'package:amuirl_flutter/Pages/Widget/GameCreation/saved_interface.dart';
import 'package:amuirl_flutter/Pages/Widget/GameCreation/task_selector.dart';
import 'package:latlong2/latlong.dart';

import 'game_map.dart';
import 'package:flutter/material.dart';

//----------------------------------------------------------------//
//------------ here all providers we need for the app ------------//
//----------------------------------------------------------------//


class CreationPageChangeProvider extends ChangeNotifier {
  late Widget widget;

  CreationPageChangeProvider(Lobby lobby) {widget = GameSettings(currentLobby: lobby);}

  void changeToGameSettings({required Lobby lobby}) {
    widget = GameSettings(currentLobby: lobby);
    notifyListeners();
  }

  void changeToTaskSelector({required Lobby lobby}) {
    widget = TaskSelector(currentLobby: lobby);
    notifyListeners();
  }

  void changeToSavedInterface({required GameMap map, required Lobby lobby}) {
    widget = SavedInterface(map: map, currentLobby: lobby);
    notifyListeners();
  }

  void changeToLoadInterface({required String path, required Lobby lobby}) {
    widget = LoadInterface(path: path, currentLobby: lobby);
    notifyListeners();
  }
}



class MapProvider extends ChangeNotifier {
  GameMap map = GameMap(taskMarkerCoord: []);

  void changeMap({required GameMap newMap}) async {
    map = newMap;
    notifyListeners();
  }

  void clear() async {
    map.clear();
    notifyListeners();
  }

  void addTaskPos({required LatLng taskPos}) async {
    map.taskMarkerCoord.add(taskPos);
    notifyListeners();
  }

  void changeLobbyPos({required LatLng? lobbyPos}) async {
    map.lobbyMarkerPos = lobbyPos;
    notifyListeners();
  }

  void deleteTaskPos({required int index}) async {
    assert(index < map.taskMarkerCoord.length);

    map.taskMarkerCoord.removeAt(index);
    notifyListeners();
  }
}