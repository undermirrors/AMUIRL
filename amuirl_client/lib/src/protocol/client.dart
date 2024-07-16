/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:amuirl_client/src/protocol/lobbies.dart' as _i3;
import 'package:amuirl_client/src/protocol/users.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointLobbies extends _i1.EndpointRef {
  EndpointLobbies(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'lobbies';

  _i2.Future<void> deleteAllLobbies() => caller.callServerEndpoint<void>(
        'lobbies',
        'deleteAllLobbies',
        {},
      );

  _i2.Future<void> createLobby(_i3.Lobby lobby) =>
      caller.callServerEndpoint<void>(
        'lobbies',
        'createLobby',
        {'lobby': lobby},
      );

  _i2.Future<void> deleteLobby(_i3.Lobby lobby) =>
      caller.callServerEndpoint<void>(
        'lobbies',
        'deleteLobby',
        {'lobby': lobby},
      );

  _i2.Future<String> addPlayer(
    int idLobby,
    _i4.User user,
  ) =>
      caller.callServerEndpoint<String>(
        'lobbies',
        'addPlayer',
        {
          'idLobby': idLobby,
          'user': user,
        },
      );

  _i2.Future<String> suppressPlayer(
    int idLobby,
    _i4.User user,
  ) =>
      caller.callServerEndpoint<String>(
        'lobbies',
        'suppressPlayer',
        {
          'idLobby': idLobby,
          'user': user,
        },
      );

  _i2.Future<List<_i3.Lobby>> getAllLobby({String? keyword}) =>
      caller.callServerEndpoint<List<_i3.Lobby>>(
        'lobbies',
        'getAllLobby',
        {'keyword': keyword},
      );

  _i2.Future<void> changeParameter(
    _i3.Lobby lobby,
    List<int> parameters,
  ) =>
      caller.callServerEndpoint<void>(
        'lobbies',
        'changeParameter',
        {
          'lobby': lobby,
          'parameters': parameters,
        },
      );

  _i2.Future<_i3.Lobby?> getLobby(int idLobby) =>
      caller.callServerEndpoint<_i3.Lobby?>(
        'lobbies',
        'getLobby',
        {'idLobby': idLobby},
      );

  _i2.Future<bool> lobbyExist(_i3.Lobby lobbyName) =>
      caller.callServerEndpoint<bool>(
        'lobbies',
        'lobbyExist',
        {'lobbyName': lobbyName},
      );
}

/// {@category Endpoint}
class EndpointUsers extends _i1.EndpointRef {
  EndpointUsers(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'users';

  _i2.Future<void> deleteAllUsers() => caller.callServerEndpoint<void>(
        'users',
        'deleteAllUsers',
        {},
      );

  _i2.Future<List<_i4.User>> getAllUser() =>
      caller.callServerEndpoint<List<_i4.User>>(
        'users',
        'getAllUser',
        {},
      );

  _i2.Future<void> createUser(_i4.User user) => caller.callServerEndpoint<void>(
        'users',
        'createUser',
        {'user': user},
      );

  _i2.Future<void> deleteUser(_i4.User user) => caller.callServerEndpoint<void>(
        'users',
        'deleteUser',
        {'user': user},
      );

  _i2.Future<_i4.User?> getUser(String username) =>
      caller.callServerEndpoint<_i4.User?>(
        'users',
        'getUser',
        {'username': username},
      );

  _i2.Future<void> changeNameUser(
    _i4.User user,
    String newName,
  ) =>
      caller.callServerEndpoint<void>(
        'users',
        'changeNameUser',
        {
          'user': user,
          'newName': newName,
        },
      );

  _i2.Future<bool> isExistingUser(String username) =>
      caller.callServerEndpoint<bool>(
        'users',
        'isExistingUser',
        {'username': username},
      );

  _i2.Future<String> changeMdp(
    String username,
    String previousMdp,
    String newMdp,
  ) =>
      caller.callServerEndpoint<String>(
        'users',
        'changeMdp',
        {
          'username': username,
          'previousMdp': previousMdp,
          'newMdp': newMdp,
        },
      );

  _i2.Future<String> enterIntoLobby(
    String username,
    int idLobby,
  ) =>
      caller.callServerEndpoint<String>(
        'users',
        'enterIntoLobby',
        {
          'username': username,
          'idLobby': idLobby,
        },
      );

  _i2.Future<String> exitLobby(String username) =>
      caller.callServerEndpoint<String>(
        'users',
        'exitLobby',
        {'username': username},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    example = EndpointExample(this);
    lobbies = EndpointLobbies(this);
    users = EndpointUsers(this);
  }

  late final EndpointExample example;

  late final EndpointLobbies lobbies;

  late final EndpointUsers users;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'lobbies': lobbies,
        'users': users,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
