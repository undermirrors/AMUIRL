/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class User extends _i1.TableRow implements _i1.ProtocolSerialization {
  User._({
    int? id,
    required this.name,
    required this.mdp,
    required this.currentlobby,
    required this.impostor,
    required this.inLife,
    this.nbBuzzerLeft,
  }) : super(id);

  factory User({
    int? id,
    required String name,
    required String mdp,
    required int currentlobby,
    required bool impostor,
    required bool inLife,
    int? nbBuzzerLeft,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      mdp: jsonSerialization['mdp'] as String,
      currentlobby: jsonSerialization['currentlobby'] as int,
      impostor: jsonSerialization['impostor'] as bool,
      inLife: jsonSerialization['inLife'] as bool,
      nbBuzzerLeft: jsonSerialization['nbBuzzerLeft'] as int?,
    );
  }

  static final t = UserTable();

  static const db = UserRepository._();

  String name;

  String mdp;

  int currentlobby;

  bool impostor;

  bool inLife;

  int? nbBuzzerLeft;

  @override
  _i1.Table get table => t;

  User copyWith({
    int? id,
    String? name,
    String? mdp,
    int? currentlobby,
    bool? impostor,
    bool? inLife,
    int? nbBuzzerLeft,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'mdp': mdp,
      'currentlobby': currentlobby,
      'impostor': impostor,
      'inLife': inLife,
      if (nbBuzzerLeft != null) 'nbBuzzerLeft': nbBuzzerLeft,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'mdp': mdp,
      'currentlobby': currentlobby,
      'impostor': impostor,
      'inLife': inLife,
      if (nbBuzzerLeft != null) 'nbBuzzerLeft': nbBuzzerLeft,
    };
  }

  static UserInclude include() {
    return UserInclude._();
  }

  static UserIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String name,
    required String mdp,
    required int currentlobby,
    required bool impostor,
    required bool inLife,
    int? nbBuzzerLeft,
  }) : super._(
          id: id,
          name: name,
          mdp: mdp,
          currentlobby: currentlobby,
          impostor: impostor,
          inLife: inLife,
          nbBuzzerLeft: nbBuzzerLeft,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    String? name,
    String? mdp,
    int? currentlobby,
    bool? impostor,
    bool? inLife,
    Object? nbBuzzerLeft = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      mdp: mdp ?? this.mdp,
      currentlobby: currentlobby ?? this.currentlobby,
      impostor: impostor ?? this.impostor,
      inLife: inLife ?? this.inLife,
      nbBuzzerLeft: nbBuzzerLeft is int? ? nbBuzzerLeft : this.nbBuzzerLeft,
    );
  }
}

class UserTable extends _i1.Table {
  UserTable({super.tableRelation}) : super(tableName: 'users') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    mdp = _i1.ColumnString(
      'mdp',
      this,
    );
    currentlobby = _i1.ColumnInt(
      'currentlobby',
      this,
    );
    impostor = _i1.ColumnBool(
      'impostor',
      this,
    );
    inLife = _i1.ColumnBool(
      'inLife',
      this,
    );
    nbBuzzerLeft = _i1.ColumnInt(
      'nbBuzzerLeft',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString mdp;

  late final _i1.ColumnInt currentlobby;

  late final _i1.ColumnBool impostor;

  late final _i1.ColumnBool inLife;

  late final _i1.ColumnInt nbBuzzerLeft;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        mdp,
        currentlobby,
        impostor,
        inLife,
        nbBuzzerLeft,
      ];
}

class UserInclude extends _i1.IncludeObject {
  UserInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => User.t;
}

class UserIncludeList extends _i1.IncludeList {
  UserIncludeList._({
    _i1.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => User.t;
}

class UserRepository {
  const UserRepository._();

  Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<User?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<User?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<User>(
      id,
      transaction: transaction,
    );
  }

  Future<List<User>> insert(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<User> insertRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<User>> update(
    _i1.Session session,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<User> updateRow(
    _i1.Session session,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<List<User>> delete(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<User> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<User>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
