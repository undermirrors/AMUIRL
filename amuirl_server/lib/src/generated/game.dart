/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Game extends _i1.TableRow implements _i1.ProtocolSerialization {
  Game._({
    int? id,
    required this.name,
    required this.players,
    required this.gameParameter,
    required this.playersDead,
    required this.indexOfImpostors,
    required this.taskLeftForEachPlayers,
    required this.totalTask,
    required this.cooldownKillByImpostors,
    required this.startedPoint,
    required this.startedPointTriggered,
    required this.isGameEnded,
    required this.dangerTriggered,
  }) : super(id);

  factory Game({
    int? id,
    required String name,
    required List<String> players,
    required List<int> gameParameter,
    required List<String> playersDead,
    required List<int> indexOfImpostors,
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
      players: (jsonSerialization['players'] as List)
          .map((e) => e as String)
          .toList(),
      gameParameter: (jsonSerialization['gameParameter'] as List)
          .map((e) => e as int)
          .toList(),
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

  static final t = GameTable();

  static const db = GameRepository._();

  String name;

  List<String> players;

  List<int> gameParameter;

  List<String> playersDead;

  List<int> indexOfImpostors;

  List<List<_i2.LatitudeLongitude>> taskLeftForEachPlayers;

  List<_i2.LatitudeLongitude> totalTask;

  List<int> cooldownKillByImpostors;

  _i2.LatitudeLongitude startedPoint;

  bool startedPointTriggered;

  bool isGameEnded;

  bool dangerTriggered;

  @override
  _i1.Table get table => t;

  Game copyWith({
    int? id,
    String? name,
    List<String>? players,
    List<int>? gameParameter,
    List<String>? playersDead,
    List<int>? indexOfImpostors,
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
      'players': players.toJson(),
      'gameParameter': gameParameter.toJson(),
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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'players': players.toJson(),
      'gameParameter': gameParameter.toJson(),
      'playersDead': playersDead.toJson(),
      'indexOfImpostors': indexOfImpostors.toJson(),
      'taskLeftForEachPlayers': taskLeftForEachPlayers.toJson(
          valueToJson: (v) =>
              v.toJson(valueToJson: (v) => v.toJsonForProtocol())),
      'totalTask': totalTask.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'cooldownKillByImpostors': cooldownKillByImpostors.toJson(),
      'startedPoint': startedPoint.toJsonForProtocol(),
      'startedPointTriggered': startedPointTriggered,
      'isGameEnded': isGameEnded,
      'dangerTriggered': dangerTriggered,
    };
  }

  static GameInclude include() {
    return GameInclude._();
  }

  static GameIncludeList includeList({
    _i1.WhereExpressionBuilder<GameTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GameTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameTable>? orderByList,
    GameInclude? include,
  }) {
    return GameIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Game.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Game.t),
      include: include,
    );
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
    required List<String> players,
    required List<int> gameParameter,
    required List<String> playersDead,
    required List<int> indexOfImpostors,
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
          players: players,
          gameParameter: gameParameter,
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
    List<String>? players,
    List<int>? gameParameter,
    List<String>? playersDead,
    List<int>? indexOfImpostors,
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
      players: players ?? this.players.clone(),
      gameParameter: gameParameter ?? this.gameParameter.clone(),
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

class GameTable extends _i1.Table {
  GameTable({super.tableRelation}) : super(tableName: 'game') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    players = _i1.ColumnSerializable(
      'players',
      this,
    );
    gameParameter = _i1.ColumnSerializable(
      'gameParameter',
      this,
    );
    playersDead = _i1.ColumnSerializable(
      'playersDead',
      this,
    );
    indexOfImpostors = _i1.ColumnSerializable(
      'indexOfImpostors',
      this,
    );
    taskLeftForEachPlayers = _i1.ColumnSerializable(
      'taskLeftForEachPlayers',
      this,
    );
    totalTask = _i1.ColumnSerializable(
      'totalTask',
      this,
    );
    cooldownKillByImpostors = _i1.ColumnSerializable(
      'cooldownKillByImpostors',
      this,
    );
    startedPoint = _i1.ColumnSerializable(
      'startedPoint',
      this,
    );
    startedPointTriggered = _i1.ColumnBool(
      'startedPointTriggered',
      this,
    );
    isGameEnded = _i1.ColumnBool(
      'isGameEnded',
      this,
    );
    dangerTriggered = _i1.ColumnBool(
      'dangerTriggered',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnSerializable players;

  late final _i1.ColumnSerializable gameParameter;

  late final _i1.ColumnSerializable playersDead;

  late final _i1.ColumnSerializable indexOfImpostors;

  late final _i1.ColumnSerializable taskLeftForEachPlayers;

  late final _i1.ColumnSerializable totalTask;

  late final _i1.ColumnSerializable cooldownKillByImpostors;

  late final _i1.ColumnSerializable startedPoint;

  late final _i1.ColumnBool startedPointTriggered;

  late final _i1.ColumnBool isGameEnded;

  late final _i1.ColumnBool dangerTriggered;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        players,
        gameParameter,
        playersDead,
        indexOfImpostors,
        taskLeftForEachPlayers,
        totalTask,
        cooldownKillByImpostors,
        startedPoint,
        startedPointTriggered,
        isGameEnded,
        dangerTriggered,
      ];
}

class GameInclude extends _i1.IncludeObject {
  GameInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Game.t;
}

class GameIncludeList extends _i1.IncludeList {
  GameIncludeList._({
    _i1.WhereExpressionBuilder<GameTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Game.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Game.t;
}

class GameRepository {
  const GameRepository._();

  Future<List<Game>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GameTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Game>(
      where: where?.call(Game.t),
      orderBy: orderBy?.call(Game.t),
      orderByList: orderByList?.call(Game.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Game?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameTable>? where,
    int? offset,
    _i1.OrderByBuilder<GameTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Game>(
      where: where?.call(Game.t),
      orderBy: orderBy?.call(Game.t),
      orderByList: orderByList?.call(Game.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Game?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Game>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Game>> insert(
    _i1.Session session,
    List<Game> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Game>(
      rows,
      transaction: transaction,
    );
  }

  Future<Game> insertRow(
    _i1.Session session,
    Game row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Game>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Game>> update(
    _i1.Session session,
    List<Game> rows, {
    _i1.ColumnSelections<GameTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Game>(
      rows,
      columns: columns?.call(Game.t),
      transaction: transaction,
    );
  }

  Future<Game> updateRow(
    _i1.Session session,
    Game row, {
    _i1.ColumnSelections<GameTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Game>(
      row,
      columns: columns?.call(Game.t),
      transaction: transaction,
    );
  }

  Future<List<Game>> delete(
    _i1.Session session,
    List<Game> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Game>(
      rows,
      transaction: transaction,
    );
  }

  Future<Game> deleteRow(
    _i1.Session session,
    Game row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Game>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Game>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GameTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Game>(
      where: where(Game.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Game>(
      where: where?.call(Game.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
