/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class LatitudeLongitude extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  LatitudeLongitude._({
    int? id,
    required this.latitude,
    required this.longitude,
  }) : super(id);

  factory LatitudeLongitude({
    int? id,
    required double latitude,
    required double longitude,
  }) = _LatitudeLongitudeImpl;

  factory LatitudeLongitude.fromJson(Map<String, dynamic> jsonSerialization) {
    return LatitudeLongitude(
      id: jsonSerialization['id'] as int?,
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
    );
  }

  static final t = LatitudeLongitudeTable();

  static const db = LatitudeLongitudeRepository._();

  double latitude;

  double longitude;

  @override
  _i1.Table get table => t;

  LatitudeLongitude copyWith({
    int? id,
    double? latitude,
    double? longitude,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  static LatitudeLongitudeInclude include() {
    return LatitudeLongitudeInclude._();
  }

  static LatitudeLongitudeIncludeList includeList({
    _i1.WhereExpressionBuilder<LatitudeLongitudeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LatitudeLongitudeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LatitudeLongitudeTable>? orderByList,
    LatitudeLongitudeInclude? include,
  }) {
    return LatitudeLongitudeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LatitudeLongitude.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(LatitudeLongitude.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LatitudeLongitudeImpl extends LatitudeLongitude {
  _LatitudeLongitudeImpl({
    int? id,
    required double latitude,
    required double longitude,
  }) : super._(
          id: id,
          latitude: latitude,
          longitude: longitude,
        );

  @override
  LatitudeLongitude copyWith({
    Object? id = _Undefined,
    double? latitude,
    double? longitude,
  }) {
    return LatitudeLongitude(
      id: id is int? ? id : this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}

class LatitudeLongitudeTable extends _i1.Table {
  LatitudeLongitudeTable({super.tableRelation})
      : super(tableName: 'latitudelongitude') {
    latitude = _i1.ColumnDouble(
      'latitude',
      this,
    );
    longitude = _i1.ColumnDouble(
      'longitude',
      this,
    );
  }

  late final _i1.ColumnDouble latitude;

  late final _i1.ColumnDouble longitude;

  @override
  List<_i1.Column> get columns => [
        id,
        latitude,
        longitude,
      ];
}

class LatitudeLongitudeInclude extends _i1.IncludeObject {
  LatitudeLongitudeInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => LatitudeLongitude.t;
}

class LatitudeLongitudeIncludeList extends _i1.IncludeList {
  LatitudeLongitudeIncludeList._({
    _i1.WhereExpressionBuilder<LatitudeLongitudeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LatitudeLongitude.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => LatitudeLongitude.t;
}

class LatitudeLongitudeRepository {
  const LatitudeLongitudeRepository._();

  Future<List<LatitudeLongitude>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LatitudeLongitudeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LatitudeLongitudeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LatitudeLongitudeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<LatitudeLongitude>(
      where: where?.call(LatitudeLongitude.t),
      orderBy: orderBy?.call(LatitudeLongitude.t),
      orderByList: orderByList?.call(LatitudeLongitude.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<LatitudeLongitude?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LatitudeLongitudeTable>? where,
    int? offset,
    _i1.OrderByBuilder<LatitudeLongitudeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LatitudeLongitudeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<LatitudeLongitude>(
      where: where?.call(LatitudeLongitude.t),
      orderBy: orderBy?.call(LatitudeLongitude.t),
      orderByList: orderByList?.call(LatitudeLongitude.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<LatitudeLongitude?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<LatitudeLongitude>(
      id,
      transaction: transaction,
    );
  }

  Future<List<LatitudeLongitude>> insert(
    _i1.Session session,
    List<LatitudeLongitude> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<LatitudeLongitude>(
      rows,
      transaction: transaction,
    );
  }

  Future<LatitudeLongitude> insertRow(
    _i1.Session session,
    LatitudeLongitude row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<LatitudeLongitude>(
      row,
      transaction: transaction,
    );
  }

  Future<List<LatitudeLongitude>> update(
    _i1.Session session,
    List<LatitudeLongitude> rows, {
    _i1.ColumnSelections<LatitudeLongitudeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<LatitudeLongitude>(
      rows,
      columns: columns?.call(LatitudeLongitude.t),
      transaction: transaction,
    );
  }

  Future<LatitudeLongitude> updateRow(
    _i1.Session session,
    LatitudeLongitude row, {
    _i1.ColumnSelections<LatitudeLongitudeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<LatitudeLongitude>(
      row,
      columns: columns?.call(LatitudeLongitude.t),
      transaction: transaction,
    );
  }

  Future<List<LatitudeLongitude>> delete(
    _i1.Session session,
    List<LatitudeLongitude> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<LatitudeLongitude>(
      rows,
      transaction: transaction,
    );
  }

  Future<LatitudeLongitude> deleteRow(
    _i1.Session session,
    LatitudeLongitude row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LatitudeLongitude>(
      row,
      transaction: transaction,
    );
  }

  Future<List<LatitudeLongitude>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LatitudeLongitudeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<LatitudeLongitude>(
      where: where(LatitudeLongitude.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LatitudeLongitudeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<LatitudeLongitude>(
      where: where?.call(LatitudeLongitude.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
