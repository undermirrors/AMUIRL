import 'package:amuirl_client/amuirl_client.dart';
import 'package:amuirl_flutter/Pages/Widget/GameCreation/game_settings.dart';
import 'package:amuirl_flutter/Pages/Widget/GameCreation/load_interface.dart';
import 'package:amuirl_flutter/Pages/Widget/GameCreation/saved_interface.dart';
import 'package:amuirl_flutter/Pages/Widget/GameCreation/task_selector.dart';
import 'package:amuirl_flutter/Pages/Widget/game.dart';
import 'package:latlong2/latlong.dart';
import 'game_creation_map.dart';
import 'package:flutter/material.dart';

//----------------------------------------------------------------//
//------------ here all providers we need for the app ------------//
//----------------------------------------------------------------//


class CreationPageChangeProvider extends ChangeNotifier {
  late Widget widget;

  CreationPageChangeProvider({required this.widget});

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

  void changeToGameInterface({required Game game, required bool isCreator}) {
    widget = GameInterface(isCreator: isCreator, currentGame: game.name,);
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

class GameProvider extends ChangeNotifier {
  Game? game;

  GameProvider();

  void modifyGame({required Game changedGame}) async {
    game = changedGame;
    notifyListeners();
  }
}