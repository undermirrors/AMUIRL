/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Lobby extends _i1.TableRow implements _i1.ProtocolSerialization {
  Lobby._({
    int? id,
    required this.name,
    required this.nbPlayer,
    required this.players,
    required this.gameParameter,
  }) : super(id);

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

  static final t = LobbyTable();

  static const db = LobbyRepository._();

  String name;

  int nbPlayer;

  List<String> players;

  List<int> gameParameter;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'nbPlayer': nbPlayer,
      'players': players.toJson(),
      'gameParameter': gameParameter.toJson(),
    };
  }

  static LobbyInclude include() {
    return LobbyInclude._();
  }

  static LobbyIncludeList includeList({
    _i1.WhereExpressionBuilder<LobbyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LobbyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LobbyTable>? orderByList,
    LobbyInclude? include,
  }) {
    return LobbyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Lobby.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Lobby.t),
      include: include,
    );
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

class LobbyTable extends _i1.Table {
  LobbyTable({super.tableRelation}) : super(tableName: 'lobby') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    nbPlayer = _i1.ColumnInt(
      'nbPlayer',
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
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt nbPlayer;

  late final _i1.ColumnSerializable players;

  late final _i1.ColumnSerializable gameParameter;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        nbPlayer,
        players,
        gameParameter,
      ];
}

class LobbyInclude extends _i1.IncludeObject {
  LobbyInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Lobby.t;
}

class LobbyIncludeList extends _i1.IncludeList {
  LobbyIncludeList._({
    _i1.WhereExpressionBuilder<LobbyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Lobby.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Lobby.t;
}

class LobbyRepository {
  const LobbyRepository._();

  Future<List<Lobby>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LobbyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LobbyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LobbyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Lobby>(
      where: where?.call(Lobby.t),
      orderBy: orderBy?.call(Lobby.t),
      orderByList: orderByList?.call(Lobby.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Lobby?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LobbyTable>? where,
    int? offset,
    _i1.OrderByBuilder<LobbyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LobbyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Lobby>(
      where: where?.call(Lobby.t),
      orderBy: orderBy?.call(Lobby.t),
      orderByList: orderByList?.call(Lobby.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Lobby?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Lobby>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Lobby>> insert(
    _i1.Session session,
    List<Lobby> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Lobby>(
      rows,
      transaction: transaction,
    );
  }

  Future<Lobby> insertRow(
    _i1.Session session,
    Lobby row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Lobby>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Lobby>> update(
    _i1.Session session,
    List<Lobby> rows, {
    _i1.ColumnSelections<LobbyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Lobby>(
      rows,
      columns: columns?.call(Lobby.t),
      transaction: transaction,
    );
  }

  Future<Lobby> updateRow(
    _i1.Session session,
    Lobby row, {
    _i1.ColumnSelections<LobbyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Lobby>(
      row,
      columns: columns?.call(Lobby.t),
      transaction: transaction,
    );
  }

  Future<List<Lobby>> delete(
    _i1.Session session,
    List<Lobby> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Lobby>(
      rows,
      transaction: transaction,
    );
  }

  Future<Lobby> deleteRow(
    _i1.Session session,
    Lobby row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Lobby>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Lobby>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LobbyTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Lobby>(
      where: where(Lobby.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LobbyTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Lobby>(
      where: where?.call(Lobby.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
