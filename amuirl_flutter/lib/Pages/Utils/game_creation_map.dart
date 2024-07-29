import 'package:latlong2/latlong.dart';

class GameMap {
  List<LatLng> taskMarkerCoord = [];
  LatLng? lobbyMarkerPos;

  GameMap({required this.taskMarkerCoord, this.lobbyMarkerPos});


  factory GameMap.fromJson(Map<String, dynamic> json) {
    List<LatLng> tasksCoord = [];
    LatLng? lobbyCoord;


    int length = json["length"];

    bool hasLobby = json["hasLobby"];

    for (int i = 0; i < length; i++) {
      tasksCoord.add(LatLng(json["tasksLatitude$i"], json["tasksLongitude$i"]));
    }

    if (hasLobby) {
      lobbyCoord = LatLng(json["lobbyLatitude"], json["lobbyLongitude"]);
    }

    return GameMap(
      taskMarkerCoord: tasksCoord,
      lobbyMarkerPos: lobbyCoord,
    );
  }


  Map<String, dynamic> toJson() {
    int length = taskMarkerCoord.length;
    Map<String, dynamic> res = <String, dynamic>{};
    var value = <String, dynamic>{"length": length};
    res.addEntries(value.entries);
    for (int i = 0; i < length; i++) {
      value = <String, dynamic>{"tasksLatitude$i": taskMarkerCoord[i].latitude, "tasksLongitude$i": taskMarkerCoord[i].longitude};
      res.addEntries(value.entries);
    }
    if (lobbyMarkerPos != null) {
      value = <String, dynamic>{"lobbyLatitude": lobbyMarkerPos!.latitude, "lobbyLongitude": lobbyMarkerPos!.longitude, "hasLobby": true};
      res.addEntries(value.entries);
    } else {
      value = <String, dynamic>{"hasLobby": false};
      res.addEntries(value.entries);
    }

    return res;
  }


  void clear() {
    taskMarkerCoord.clear();
    lobbyMarkerPos = null;
  }
}