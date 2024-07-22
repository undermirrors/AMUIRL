/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class Game implements _i1.SerializableModel {
  Game._({
    this.id,
    required this.name,
    required this.playersPosition,
    required this.players,
    required this.timeBetweenImpostorKill,
    required this.killDistance,
    required this.nbUrgencyCall,
    required this.timeDiscutionVote,
    required this.playersDead,
    required this.indexOfImpostors,
    required this.taskLeftForEachPlayers,
    required this.totalTask,
    required this.cooldownKillByImpostors,
    required this.startedPoint,
    required this.startedPointTriggered,
    required this.isGameEnded,
    required this.dangerTriggered,
  });

  factory Game({
    int? id,
    required String name,
    required List<_i2.LatitudeLongitude?> playersPosition,
    required List<String> players,
    required int timeBetweenImpostorKill,
    required int killDistance,
    required int nbUrgencyCall,
    required int timeDiscutionVote,
    required List<String> playersDead,
    required List<String> indexOfImpostors,
    required List<List<_i2.LatitudeLongitude>> taskLeftForEachPlayers,
    required List<_i2.LatitudeLongitude> totalTask,
    required List<int> cooldownKillByImpostors,
    required _i2.LatitudeLongitude startedPoint,
    required bool startedPointTriggered,
    required bool isGameEnded,
    required bool dangerTriggered,
  }) = _GameImpl;

  factory Game.fromJson(Map<String, dynamic> jsonSerialization) {
    return Game(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      playersPosition: (jsonSerialization['playersPosition'] as List)
          .map((e) => e == null
              ? null
              : _i2.LatitudeLongitude.fromJson((e as Map<String, dynamic>)))
          .toList(),
      players: (jsonSerialization['players'] as List)
          .map((e) => e as String)
          .toList(),
      timeBetweenImpostorKill:
          jsonSerialization['timeBetweenImpostorKill'] as int,
      killDistance: jsonSerialization['killDistance'] as int,
      nbUrgencyCall: jsonSerialization['nbUrgencyCall'] as int,
      timeDiscutionVote: jsonSerialization['timeDiscutionVote'] as int,
      playersDead: (jsonSerialization['playersDead'] as List)
          .map((e) => e as String)
          .toList(),
      indexOfImpostors: (jsonSerialization['indexOfImpostors'] as List)
          .map((e) => e as String)
          .toList(),
      taskLeftForEachPlayers: (jsonSerialization['taskLeftForEachPlayers']
              as List)
          .map((e) => (e as List)
              .map((e) =>
                  _i2.LatitudeLongitude.fromJson((e as Map<String, dynamic>)))
              .toList())
          .toList(),
      totalTask: (jsonSerialization['totalTask'] as List)
          .map((e) =>
              _i2.LatitudeLongitude.fromJson((e as Map<String, dynamic>)))
          .toList(),
      cooldownKillByImpostors:
          (jsonSerialization['cooldownKillByImpostors'] as List)
              .map((e) => e as int)
              .toList(),
      startedPoint: _i2.LatitudeLongitude.fromJson(
          (jsonSerialization['startedPoint'] as Map<String, dynamic>)),
      startedPointTriggered: jsonSerialization['startedPointTriggered'] as bool,
      isGameEnded: jsonSerialization['isGameEnded'] as bool,
      dangerTriggered: jsonSerialization['dangerTriggered'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  List<_i2.LatitudeLongitude?> playersPosition;

  List<String> players;

  int timeBetweenImpostorKill;

  int killDistance;

  int nbUrgencyCall;

  int timeDiscutionVote;

  List<String> playersDead;

  List<String> indexOfImpostors;

  List<List<_i2.LatitudeLongitude>> taskLeftForEachPlayers;

  List<_i2.LatitudeLongitude> totalTask;

  List<int> cooldownKillByImpostors;

  _i2.LatitudeLongitude startedPoint;

  bool startedPointTriggered;

  bool isGameEnded;

  bool dangerTriggered;

  Game copyWith({
    int? id,
    String? name,
    List<_i2.LatitudeLongitude?>? playersPosition,
    List<String>? players,
    int? timeBetweenImpostorKill,
    int? killDistance,
    int? nbUrgencyCall,
    int? timeDiscutionVote,
    List<String>? playersDead,
    List<String>? indexOfImpostors,
    List<List<_i2.LatitudeLongitude>>? taskLeftForEachPlayers,
    List<_i2.LatitudeLongitude>? totalTask,
    List<int>? cooldownKillByImpostors,
    _i2.LatitudeLongitude? startedPoint,
    bool? startedPointTriggered,
    bool? isGameEnded,
    bool? dangerTriggered,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'playersPosition':
          playersPosition.toJson(valueToJson: (v) => v?.toJson()),
      'players': players.toJson(),
      'timeBetweenImpostorKill': timeBetweenImpostorKill,
      'killDistance': killDistance,
      'nbUrgencyCall': nbUrgencyCall,
      'timeDiscutionVote': timeDiscutionVote,
      'playersDead': playersDead.toJson(),
      'indexOfImpostors': indexOfImpostors.toJson(),
      'taskLeftForEachPlayers': taskLeftForEachPlayers.toJson(
          valueToJson: (v) => v.toJson(valueToJson: (v) => v.toJson())),
      'totalTask': totalTask.toJson(valueToJson: (v) => v.toJson()),
      'cooldownKillByImpostors': cooldownKillByImpostors.toJson(),
      'startedPoint': startedPoint.toJson(),
      'startedPointTriggered': startedPointTriggered,
      'isGameEnded': isGameEnded,
      'dangerTriggered': dangerTriggered,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GameImpl extends Game {
  _GameImpl({
    int? id,
    required String name,
    required List<_i2.LatitudeLongitude?> playersPosition,
    required List<String> players,
    required int timeBetweenImpostorKill,
    required int killDistance,
    required int nbUrgencyCall,
    required int timeDiscutionVote,
    required List<String> playersDead,
    required List<String> indexOfImpostors,
    required List<List<_i2.LatitudeLongitude>> taskLeftForEachPlayers,
    required List<_i2.LatitudeLongitude> totalTask,
    required List<int> cooldownKillByImpostors,
    required _i2.LatitudeLongitude startedPoint,
    required bool startedPointTriggered,
    required bool isGameEnded,
    required bool dangerTriggered,
  }) : super._(
          id: id,
          name: name,
          playersPosition: playersPosition,
          players: players,
          timeBetweenImpostorKill: timeBetweenImpostorKill,
          killDistance: killDistance,
          nbUrgencyCall: nbUrgencyCall,
          timeDiscutionVote: timeDiscutionVote,
          playersDead: playersDead,
          indexOfImpostors: indexOfImpostors,
          taskLeftForEachPlayers: taskLeftForEachPlayers,
          totalTask: totalTask,
          cooldownKillByImpostors: cooldownKillByImpostors,
          startedPoint: startedPoint,
          startedPointTriggered: startedPointTriggered,
          isGameEnded: isGameEnded,
          dangerTriggered: dangerTriggered,
        );

  @override
  Game copyWith({
    Object? id = _Undefined,
    String? name,
    List<_i2.LatitudeLongitude?>? playersPosition,
    List<String>? players,
    int? timeBetweenImpostorKill,
    int? killDistance,
    int? nbUrgencyCall,
    int? timeDiscutionVote,
    List<String>? playersDead,
    List<String>? indexOfImpostors,
    List<List<_i2.LatitudeLongitude>>? taskLeftForEachPlayers,
    List<_i2.LatitudeLongitude>? totalTask,
    List<int>? cooldownKillByImpostors,
    _i2.LatitudeLongitude? startedPoint,
    bool? startedPointTriggered,
    bool? isGameEnded,
    bool? dangerTriggered,
  }) {
    return Game(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      playersPosition: playersPosition ?? this.playersPosition.clone(),
      players: players ?? this.players.clone(),
      timeBetweenImpostorKill:
          timeBetweenImpostorKill ?? this.timeBetweenImpostorKill,
      killDistance: killDistance ?? this.killDistance,
      nbUrgencyCall: nbUrgencyCall ?? this.nbUrgencyCall,
      timeDiscutionVote: timeDiscutionVote ?? this.timeDiscutionVote,
      playersDead: playersDead ?? this.playersDead.clone(),
      indexOfImpostors: indexOfImpostors ?? this.indexOfImpostors.clone(),
      taskLeftForEachPlayers:
          taskLeftForEachPlayers ?? this.taskLeftForEachPlayers.clone(),
      totalTask: totalTask ?? this.totalTask.clone(),
      cooldownKillByImpostors:
          cooldownKillByImpostors ?? this.cooldownKillByImpostors.clone(),
      startedPoint: startedPoint ?? this.startedPoint.copyWith(),
      startedPointTriggered:
          startedPointTriggered ?? this.startedPointTriggered,
      isGameEnded: isGameEnded ?? this.isGameEnded,
      dangerTriggered: dangerTriggered ?? this.dangerTriggered,
    );
  }
}
