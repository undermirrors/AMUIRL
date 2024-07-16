/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Lobby implements _i1.SerializableModel {
  Lobby._({
    this.id,
    required this.name,
    required this.nbPlayer,
    required this.players,
    required this.gameParameter,
  });

  factory Lobby({
    int? id,
    required String name,
    required int nbPlayer,
    required List<String> players,
    required List<int> gameParameter,
  }) = _LobbyImpl;

  factory Lobby.fromJson(Map<String, dynamic> jsonSerialization) {
    return Lobby(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      nbPlayer: jsonSerialization['nbPlayer'] as int,
      players: (jsonSerialization['players'] as List)
          .map((e) => e as String)
          .toList(),
      gameParameter: (jsonSerialization['gameParameter'] as List)
          .map((e) => e as int)
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int nbPlayer;

  List<String> players;

  List<int> gameParameter;

  Lobby copyWith({
    int? id,
    String? name,
    int? nbPlayer,
    List<String>? players,
    List<int>? gameParameter,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'nbPlayer': nbPlayer,
      'players': players.toJson(),
      'gameParameter': gameParameter.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LobbyImpl extends Lobby {
  _LobbyImpl({
    int? id,
    required String name,
    required int nbPlayer,
    required List<String> players,
    required List<int> gameParameter,
  }) : super._(
          id: id,
          name: name,
          nbPlayer: nbPlayer,
          players: players,
          gameParameter: gameParameter,
        );

  @override
  Lobby copyWith({
    Object? id = _Undefined,
    String? name,
    int? nbPlayer,
    List<String>? players,
    List<int>? gameParameter,
  }) {
    return Lobby(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      nbPlayer: nbPlayer ?? this.nbPlayer,
      players: players ?? this.players.clone(),
      gameParameter: gameParameter ?? this.gameParameter.clone(),
    );
  }
}
