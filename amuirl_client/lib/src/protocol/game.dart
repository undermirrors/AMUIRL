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
    required this.lobby,
    required this.playersDead,
    required this.indexOfImpostors,
    required this.taskLeftForEachPlayers,
    required this.cooldownKillByImpostors,
    required this.startedPoint,
    required this.startedPointTriggered,
  });

  factory Game({
    int? id,
    required _i2.Lobby lobby,
    required List<String> playersDead,
    required List<int> indexOfImpostors,
    required List<List<_i2.LatitudeLongitude>> taskLeftForEachPlayers,
    required List<int> cooldownKillByImpostors,
    required _i2.LatitudeLongitude startedPoint,
    required bool startedPointTriggered,
  }) = _GameImpl;

  factory Game.fromJson(Map<String, dynamic> jsonSerialization) {
    return Game(
      id: jsonSerialization['id'] as int?,
      lobby: _i2.Lobby.fromJson(
          (jsonSerialization['lobby'] as Map<String, dynamic>)),
      playersDead: (jsonSerialization['playersDead'] as List)
          .map((e) => e as String)
          .toList(),
      indexOfImpostors: (jsonSerialization['indexOfImpostors'] as List)
          .map((e) => e as int)
          .toList(),
      taskLeftForEachPlayers: (jsonSerialization['taskLeftForEachPlayers']
              as List)
          .map((e) => (e as List)
              .map((e) =>
                  _i2.LatitudeLongitude.fromJson((e as Map<String, dynamic>)))
              .toList())
          .toList(),
      cooldownKillByImpostors:
          (jsonSerialization['cooldownKillByImpostors'] as List)
              .map((e) => e as int)
              .toList(),
      startedPoint: _i2.LatitudeLongitude.fromJson(
          (jsonSerialization['startedPoint'] as Map<String, dynamic>)),
      startedPointTriggered: jsonSerialization['startedPointTriggered'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i2.Lobby lobby;

  List<String> playersDead;

  List<int> indexOfImpostors;

  List<List<_i2.LatitudeLongitude>> taskLeftForEachPlayers;

  List<int> cooldownKillByImpostors;

  _i2.LatitudeLongitude startedPoint;

  bool startedPointTriggered;

  Game copyWith({
    int? id,
    _i2.Lobby? lobby,
    List<String>? playersDead,
    List<int>? indexOfImpostors,
    List<List<_i2.LatitudeLongitude>>? taskLeftForEachPlayers,
    List<int>? cooldownKillByImpostors,
    _i2.LatitudeLongitude? startedPoint,
    bool? startedPointTriggered,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'lobby': lobby.toJson(),
      'playersDead': playersDead.toJson(),
      'indexOfImpostors': indexOfImpostors.toJson(),
      'taskLeftForEachPlayers': taskLeftForEachPlayers.toJson(
          valueToJson: (v) => v.toJson(valueToJson: (v) => v.toJson())),
      'cooldownKillByImpostors': cooldownKillByImpostors.toJson(),
      'startedPoint': startedPoint.toJson(),
      'startedPointTriggered': startedPointTriggered,
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
    required _i2.Lobby lobby,
    required List<String> playersDead,
    required List<int> indexOfImpostors,
    required List<List<_i2.LatitudeLongitude>> taskLeftForEachPlayers,
    required List<int> cooldownKillByImpostors,
    required _i2.LatitudeLongitude startedPoint,
    required bool startedPointTriggered,
  }) : super._(
          id: id,
          lobby: lobby,
          playersDead: playersDead,
          indexOfImpostors: indexOfImpostors,
          taskLeftForEachPlayers: taskLeftForEachPlayers,
          cooldownKillByImpostors: cooldownKillByImpostors,
          startedPoint: startedPoint,
          startedPointTriggered: startedPointTriggered,
        );

  @override
  Game copyWith({
    Object? id = _Undefined,
    _i2.Lobby? lobby,
    List<String>? playersDead,
    List<int>? indexOfImpostors,
    List<List<_i2.LatitudeLongitude>>? taskLeftForEachPlayers,
    List<int>? cooldownKillByImpostors,
    _i2.LatitudeLongitude? startedPoint,
    bool? startedPointTriggered,
  }) {
    return Game(
      id: id is int? ? id : this.id,
      lobby: lobby ?? this.lobby.copyWith(),
      playersDead: playersDead ?? this.playersDead.clone(),
      indexOfImpostors: indexOfImpostors ?? this.indexOfImpostors.clone(),
      taskLeftForEachPlayers:
          taskLeftForEachPlayers ?? this.taskLeftForEachPlayers.clone(),
      cooldownKillByImpostors:
          cooldownKillByImpostors ?? this.cooldownKillByImpostors.clone(),
      startedPoint: startedPoint ?? this.startedPoint.copyWith(),
      startedPointTriggered:
          startedPointTriggered ?? this.startedPointTriggered,
    );
  }
}
