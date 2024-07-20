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

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.name,
    required this.mdp,
    required this.currentlobby,
    required this.impostor,
    required this.inLife,
    this.nbBuzzerLeft,
    this.nbtaskLeft,
    this.position,
  });

  factory User({
    int? id,
    required String name,
    required String mdp,
    required int currentlobby,
    required bool impostor,
    required bool inLife,
    int? nbBuzzerLeft,
    int? nbtaskLeft,
    _i2.LatitudeLongitude? position,
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
      nbtaskLeft: jsonSerialization['nbtaskLeft'] as int?,
      position: jsonSerialization['position'] == null
          ? null
          : _i2.LatitudeLongitude.fromJson(
              (jsonSerialization['position'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String mdp;

  int currentlobby;

  bool impostor;

  bool inLife;

  int? nbBuzzerLeft;

  int? nbtaskLeft;

  _i2.LatitudeLongitude? position;

  User copyWith({
    int? id,
    String? name,
    String? mdp,
    int? currentlobby,
    bool? impostor,
    bool? inLife,
    int? nbBuzzerLeft,
    int? nbtaskLeft,
    _i2.LatitudeLongitude? position,
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
      if (nbtaskLeft != null) 'nbtaskLeft': nbtaskLeft,
      if (position != null) 'position': position?.toJson(),
    };
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
    int? nbtaskLeft,
    _i2.LatitudeLongitude? position,
  }) : super._(
          id: id,
          name: name,
          mdp: mdp,
          currentlobby: currentlobby,
          impostor: impostor,
          inLife: inLife,
          nbBuzzerLeft: nbBuzzerLeft,
          nbtaskLeft: nbtaskLeft,
          position: position,
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
    Object? nbtaskLeft = _Undefined,
    Object? position = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      mdp: mdp ?? this.mdp,
      currentlobby: currentlobby ?? this.currentlobby,
      impostor: impostor ?? this.impostor,
      inLife: inLife ?? this.inLife,
      nbBuzzerLeft: nbBuzzerLeft is int? ? nbBuzzerLeft : this.nbBuzzerLeft,
      nbtaskLeft: nbtaskLeft is int? ? nbtaskLeft : this.nbtaskLeft,
      position: position is _i2.LatitudeLongitude?
          ? position
          : this.position?.copyWith(),
    );
  }
}
