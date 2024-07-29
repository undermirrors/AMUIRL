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
import 'package:amuirl_client/src/protocol/game.dart' as _i3;
import 'package:amuirl_client/src/protocol/latitudelongitude.dart' as _i4;
import 'package:amuirl_client/src/protocol/lobbies.dart' as _i5;
import 'package:amuirl_client/src/protocol/users.dart' as _i6;
import 'protocol.dart' as _i7;

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
class EndpointGame extends _i1.EndpointRef {
  EndpointGame(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'game';

  _i2.Future<void> createGame(_i3.Game game) => caller.callServerEndpoint<void>(
        'game',
        'createGame',
        {'game': game},
      );

  _i2.Future<void> deleteGame(_i3.Game game) => caller.callServerEndpoint<void>(
        'game',
        'deleteGame',
        {'game': game},
      );

  _i2.Future<_i3.Game?> getGame(String nameGame) =>
      caller.callServerEndpoint<_i3.Game?>(
        'game',
        'getGame',
        {'nameGame': nameGame},
      );

  _i2.Future<bool?> killPlayer(
    String nameGame,
    String playerName,
  ) =>
      caller.callServerEndpoint<bool?>(
        'game',
        'killPlayer',
        {
          'nameGame': nameGame,
          'playerName': playerName,
        },
      );

  _i2.Future<bool?> isDeadPlayer(
    String nameGame,
    String playerName,
  ) =>
      caller.callServerEndpoint<bool?>(
        'game',
        'isDeadPlayer',
        {
          'nameGame': nameGame,
          'playerName': playerName,
        },
      );

  _i2.Future<List<String>?> getImpostors(String nameGame) =>
      caller.callServerEndpoint<List<String>?>(
        'game',
        'getImpostors',
        {'nameGame': nameGame},
      );

  _i2.Future<bool> finishTask(
    String nameGame,
    String playerName,
    int taskIndex,
  ) =>
      caller.callServerEndpoint<bool>(
        'game',
        'finishTask',
        {
          'nameGame': nameGame,
          'playerName': playerName,
          'taskIndex': taskIndex,
        },
      );

  _i2.Future<void> triggerLobby(String nameGame) =>
      caller.callServerEndpoint<void>(
        'game',
        'triggerLobby',
        {'nameGame': nameGame},
      );

  _i2.Future<bool?> isTriggeredLobby(String nameGame) =>
      caller.callServerEndpoint<bool?>(
        'game',
        'isTriggeredLobby',
        {'nameGame': nameGame},
      );

  _i2.Future<List<_i4.LatitudeLongitude?>?> getPlayersPosition(
          String nameGame) =>
      caller.callServerEndpoint<List<_i4.LatitudeLongitude?>?>(
        'game',
        'getPlayersPosition',
        {'nameGame': nameGame},
      );

  _i2.Future<void> updatePlayerPosition(
    String nameGame,
    String playerName,
    _i4.LatitudeLongitude newPos,
  ) =>
      caller.callServerEndpoint<void>(
        'game',
        'updatePlayerPosition',
        {
          'nameGame': nameGame,
          'playerName': playerName,
          'newPos': newPos,
        },
      );

  _i2.Future<void> dangerActivatedOrDesactivated(
    String nameGame,
    bool changementStatus,
  ) =>
      caller.callServerEndpoint<void>(
        'game',
        'dangerActivatedOrDesactivated',
        {
          'nameGame': nameGame,
          'changementStatus': changementStatus,
        },
      );

  _i2.Future<bool?> isDangerLaunched(String nameGame) =>
      caller.callServerEndpoint<bool?>(
        'game',
        'isDangerLaunched',
        {'nameGame': nameGame},
      );

  _i2.Future<List<String>?> getAllPlayer(String nameGame) =>
      caller.callServerEndpoint<List<String>?>(
        'game',
        'getAllPlayer',
        {'nameGame': nameGame},
      );

  _i2.Future<int> getGameTotalTaskLeft(String nameGame) =>
      caller.callServerEndpoint<int>(
        'game',
        'getGameTotalTaskLeft',
        {'nameGame': nameGame},
      );

  _i2.Future<void> testIfGameEnded(String nameGame) =>
      caller.callServerEndpoint<void>(
        'game',
        'testIfGameEnded',
        {'nameGame': nameGame},
      );

  _i2.Future<void> endGame(String nameGame) => caller.callServerEndpoint<void>(
        'game',
        'endGame',
        {'nameGame': nameGame},
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

  _i2.Future<void> createLobby(_i5.Lobby lobby) =>
      caller.callServerEndpoint<void>(
        'lobbies',
        'createLobby',
        {'lobby': lobby},
      );

  _i2.Future<void> deleteLobby(_i5.Lobby lobby) =>
      caller.callServerEndpoint<void>(
        'lobbies',
        'deleteLobby',
        {'lobby': lobby},
      );

  _i2.Future<String> addPlayer(
    int idLobby,
    _i6.User user,
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
    _i6.User user,
  ) =>
      caller.callServerEndpoint<String>(
        'lobbies',
        'suppressPlayer',
        {
          'idLobby': idLobby,
          'user': user,
        },
      );

  _i2.Future<List<_i5.Lobby>> getAllLobby({String? keyword}) =>
      caller.callServerEndpoint<List<_i5.Lobby>>(
        'lobbies',
        'getAllLobby',
        {'keyword': keyword},
      );

  _i2.Future<void> changeParameter(
    _i5.Lobby lobby,
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

  _i2.Future<_i5.Lobby?> getLobby(int idLobby) =>
      caller.callServerEndpoint<_i5.Lobby?>(
        'lobbies',
        'getLobby',
        {'idLobby': idLobby},
      );

  _i2.Future<bool> lobbyExist(_i5.Lobby lobbyName) =>
      caller.callServerEndpoint<bool>(
        'lobbies',
        'lobbyExist',
        {'lobbyName': lobbyName},
      );

  _i2.Future<void> gameLaunch(int idLobby) => caller.callServerEndpoint<void>(
        'lobbies',
        'gameLaunch',
        {'idLobby': idLobby},
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

  _i2.Future<List<_i6.User>> getAllUser() =>
      caller.callServerEndpoint<List<_i6.User>>(
        'users',
        'getAllUser',
        {},
      );

  _i2.Future<void> createUser(_i6.User user) => caller.callServerEndpoint<void>(
        'users',
        'createUser',
        {'user': user},
      );

  _i2.Future<void> deleteUser(_i6.User user) => caller.callServerEndpoint<void>(
        'users',
        'deleteUser',
        {'user': user},
      );

  _i2.Future<_i6.User?> getUser(String username) =>
      caller.callServerEndpoint<_i6.User?>(
        'users',
        'getUser',
        {'username': username},
      );

  _i2.Future<void> changeNameUser(
    _i6.User user,
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
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    example = EndpointExample(this);
    game = EndpointGame(this);
    lobbies = EndpointLobbies(this);
    users = EndpointUsers(this);
  }

  late final EndpointExample example;

  late final EndpointGame game;

  late final EndpointLobbies lobbies;

  late final EndpointUsers users;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'game': game,
        'lobbies': lobbies,
        'users': users,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
