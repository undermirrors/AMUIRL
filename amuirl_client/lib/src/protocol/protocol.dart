/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'example.dart' as _i2;
import 'game.dart' as _i3;
import 'latitudelongitude.dart' as _i4;
import 'lobbies.dart' as _i5;
import 'users.dart' as _i6;
import 'protocol.dart' as _i7;
import 'package:amuirl_client/src/protocol/lobbies.dart' as _i8;
import 'package:amuirl_client/src/protocol/users.dart' as _i9;
export 'example.dart';
export 'game.dart';
export 'latitudelongitude.dart';
export 'lobbies.dart';
export 'users.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Example) {
      return _i2.Example.fromJson(data) as T;
    }
    if (t == _i3.Game) {
      return _i3.Game.fromJson(data) as T;
    }
    if (t == _i4.LatitudeLongitude) {
      return _i4.LatitudeLongitude.fromJson(data) as T;
    }
    if (t == _i5.Lobby) {
      return _i5.Lobby.fromJson(data) as T;
    }
    if (t == _i6.User) {
      return _i6.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Example?>()) {
      return (data != null ? _i2.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Game?>()) {
      return (data != null ? _i3.Game.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.LatitudeLongitude?>()) {
      return (data != null ? _i4.LatitudeLongitude.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Lobby?>()) {
      return (data != null ? _i5.Lobby.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.User?>()) {
      return (data != null ? _i6.User.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<List<_i7.LatitudeLongitude>>) {
      return (data as List)
          .map((e) => deserialize<List<_i7.LatitudeLongitude>>(e))
          .toList() as dynamic;
    }
    if (t == List<_i7.LatitudeLongitude>) {
      return (data as List)
          .map((e) => deserialize<_i7.LatitudeLongitude>(e))
          .toList() as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i8.Lobby>) {
      return (data as List).map((e) => deserialize<_i8.Lobby>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i9.User>) {
      return (data as List).map((e) => deserialize<_i9.User>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Example) {
      return 'Example';
    }
    if (data is _i3.Game) {
      return 'Game';
    }
    if (data is _i4.LatitudeLongitude) {
      return 'LatitudeLongitude';
    }
    if (data is _i5.Lobby) {
      return 'Lobby';
    }
    if (data is _i6.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Example') {
      return deserialize<_i2.Example>(data['data']);
    }
    if (data['className'] == 'Game') {
      return deserialize<_i3.Game>(data['data']);
    }
    if (data['className'] == 'LatitudeLongitude') {
      return deserialize<_i4.LatitudeLongitude>(data['data']);
    }
    if (data['className'] == 'Lobby') {
      return deserialize<_i5.Lobby>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i6.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
