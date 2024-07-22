/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/example_endpoint.dart' as _i2;
import '../endpoints/game_endpoint.dart' as _i3;
import '../endpoints/lobbies_endpoint.dart' as _i4;
import '../endpoints/users_endpoint.dart' as _i5;
import 'package:amuirl_server/src/generated/game.dart' as _i6;
import 'package:amuirl_server/src/generated/latitudelongitude.dart' as _i7;
import 'package:amuirl_server/src/generated/lobbies.dart' as _i8;
import 'package:amuirl_server/src/generated/users.dart' as _i9;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'example': _i2.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'game': _i3.GameEndpoint()
        ..initialize(
          server,
          'game',
          null,
        ),
      'lobbies': _i4.LobbiesEndpoint()
        ..initialize(
          server,
          'lobbies',
          null,
        ),
      'users': _i5.UsersEndpoint()
        ..initialize(
          server,
          'users',
          null,
        ),
    };
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i2.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['game'] = _i1.EndpointConnector(
      name: 'game',
      endpoint: endpoints['game']!,
      methodConnectors: {
        'createGame': _i1.MethodConnector(
          name: 'createGame',
          params: {
            'game': _i1.ParameterDescription(
              name: 'game',
              type: _i1.getType<_i6.Game>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint).createGame(
            session,
            params['game'],
          ),
        ),
        'deleteGame': _i1.MethodConnector(
          name: 'deleteGame',
          params: {
            'game': _i1.ParameterDescription(
              name: 'game',
              type: _i1.getType<_i6.Game>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint).deleteGame(
            session,
            params['game'],
          ),
        ),
        'getGame': _i1.MethodConnector(
          name: 'getGame',
          params: {
            'nameGame': _i1.ParameterDescription(
              name: 'nameGame',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint).getGame(
            session,
            params['nameGame'],
          ),
        ),
        'killPlayer': _i1.MethodConnector(
          name: 'killPlayer',
          params: {
            'nameGame': _i1.ParameterDescription(
              name: 'nameGame',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'playerName': _i1.ParameterDescription(
              name: 'playerName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint).killPlayer(
            session,
            params['nameGame'],
            params['playerName'],
          ),
        ),
        'isDeadPlayer': _i1.MethodConnector(
          name: 'isDeadPlayer',
          params: {
            'nameGame': _i1.ParameterDescription(
              name: 'nameGame',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'playerName': _i1.ParameterDescription(
              name: 'playerName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint).isDeadPlayer(
            session,
            params['nameGame'],
            params['playerName'],
          ),
        ),
        'getImpostors': _i1.MethodConnector(
          name: 'getImpostors',
          params: {
            'nameGame': _i1.ParameterDescription(
              name: 'nameGame',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint).getImpostors(
            session,
            params['nameGame'],
          ),
        ),
        'finishTask': _i1.MethodConnector(
          name: 'finishTask',
          params: {
            'nameGame': _i1.ParameterDescription(
              name: 'nameGame',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'playerName': _i1.ParameterDescription(
              name: 'playerName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'task': _i1.ParameterDescription(
              name: 'task',
              type: _i1.getType<_i7.LatitudeLongitude>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint).finishTask(
            session,
            params['nameGame'],
            params['playerName'],
            params['task'],
          ),
        ),
        'triggerLobby': _i1.MethodConnector(
          name: 'triggerLobby',
          params: {
            'nameGame': _i1.ParameterDescription(
              name: 'nameGame',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint).triggerLobby(
            session,
            params['nameGame'],
          ),
        ),
        'isTriggeredLobby': _i1.MethodConnector(
          name: 'isTriggeredLobby',
          params: {
            'nameGame': _i1.ParameterDescription(
              name: 'nameGame',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint).isTriggeredLobby(
            session,
            params['nameGame'],
          ),
        ),
        'getPlayersPosition': _i1.MethodConnector(
          name: 'getPlayersPosition',
          params: {
            'nameGame': _i1.ParameterDescription(
              name: 'nameGame',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint).getPlayersPosition(
            session,
            params['nameGame'],
          ),
        ),
        'updatePlayerPosition': _i1.MethodConnector(
          name: 'updatePlayerPosition',
          params: {
            'nameGame': _i1.ParameterDescription(
              name: 'nameGame',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'playerName': _i1.ParameterDescription(
              name: 'playerName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPos': _i1.ParameterDescription(
              name: 'newPos',
              type: _i1.getType<_i7.LatitudeLongitude>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint).updatePlayerPosition(
            session,
            params['nameGame'],
            params['playerName'],
            params['newPos'],
          ),
        ),
        'dangerActivatedOrDesactivated': _i1.MethodConnector(
          name: 'dangerActivatedOrDesactivated',
          params: {
            'nameGame': _i1.ParameterDescription(
              name: 'nameGame',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'changementStatus': _i1.ParameterDescription(
              name: 'changementStatus',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint)
                  .dangerActivatedOrDesactivated(
            session,
            params['nameGame'],
            params['changementStatus'],
          ),
        ),
        'isDangerLaunched': _i1.MethodConnector(
          name: 'isDangerLaunched',
          params: {
            'nameGame': _i1.ParameterDescription(
              name: 'nameGame',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint).isDangerLaunched(
            session,
            params['nameGame'],
          ),
        ),
        'getAllPlayer': _i1.MethodConnector(
          name: 'getAllPlayer',
          params: {
            'nameGame': _i1.ParameterDescription(
              name: 'nameGame',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint).getAllPlayer(
            session,
            params['nameGame'],
          ),
        ),
        'getGameTotalTaskLeft': _i1.MethodConnector(
          name: 'getGameTotalTaskLeft',
          params: {
            'nameGame': _i1.ParameterDescription(
              name: 'nameGame',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint).getGameTotalTaskLeft(
            session,
            params['nameGame'],
          ),
        ),
        'testIfGameEnded': _i1.MethodConnector(
          name: 'testIfGameEnded',
          params: {
            'nameGame': _i1.ParameterDescription(
              name: 'nameGame',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i3.GameEndpoint).testIfGameEnded(
            session,
            params['nameGame'],
          ),
        ),
      },
    );
    connectors['lobbies'] = _i1.EndpointConnector(
      name: 'lobbies',
      endpoint: endpoints['lobbies']!,
      methodConnectors: {
        'deleteAllLobbies': _i1.MethodConnector(
          name: 'deleteAllLobbies',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lobbies'] as _i4.LobbiesEndpoint)
                  .deleteAllLobbies(session),
        ),
        'createLobby': _i1.MethodConnector(
          name: 'createLobby',
          params: {
            'lobby': _i1.ParameterDescription(
              name: 'lobby',
              type: _i1.getType<_i8.Lobby>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lobbies'] as _i4.LobbiesEndpoint).createLobby(
            session,
            params['lobby'],
          ),
        ),
        'deleteLobby': _i1.MethodConnector(
          name: 'deleteLobby',
          params: {
            'lobby': _i1.ParameterDescription(
              name: 'lobby',
              type: _i1.getType<_i8.Lobby>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lobbies'] as _i4.LobbiesEndpoint).deleteLobby(
            session,
            params['lobby'],
          ),
        ),
        'addPlayer': _i1.MethodConnector(
          name: 'addPlayer',
          params: {
            'idLobby': _i1.ParameterDescription(
              name: 'idLobby',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i9.User>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lobbies'] as _i4.LobbiesEndpoint).addPlayer(
            session,
            params['idLobby'],
            params['user'],
          ),
        ),
        'suppressPlayer': _i1.MethodConnector(
          name: 'suppressPlayer',
          params: {
            'idLobby': _i1.ParameterDescription(
              name: 'idLobby',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i9.User>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lobbies'] as _i4.LobbiesEndpoint).suppressPlayer(
            session,
            params['idLobby'],
            params['user'],
          ),
        ),
        'getAllLobby': _i1.MethodConnector(
          name: 'getAllLobby',
          params: {
            'keyword': _i1.ParameterDescription(
              name: 'keyword',
              type: _i1.getType<String?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lobbies'] as _i4.LobbiesEndpoint).getAllLobby(
            session,
            keyword: params['keyword'],
          ),
        ),
        'changeParameter': _i1.MethodConnector(
          name: 'changeParameter',
          params: {
            'lobby': _i1.ParameterDescription(
              name: 'lobby',
              type: _i1.getType<_i8.Lobby>(),
              nullable: false,
            ),
            'parameters': _i1.ParameterDescription(
              name: 'parameters',
              type: _i1.getType<List<int>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lobbies'] as _i4.LobbiesEndpoint).changeParameter(
            session,
            params['lobby'],
            params['parameters'],
          ),
        ),
        'getLobby': _i1.MethodConnector(
          name: 'getLobby',
          params: {
            'idLobby': _i1.ParameterDescription(
              name: 'idLobby',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lobbies'] as _i4.LobbiesEndpoint).getLobby(
            session,
            params['idLobby'],
          ),
        ),
        'lobbyExist': _i1.MethodConnector(
          name: 'lobbyExist',
          params: {
            'lobbyName': _i1.ParameterDescription(
              name: 'lobbyName',
              type: _i1.getType<_i8.Lobby>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lobbies'] as _i4.LobbiesEndpoint).lobbyExist(
            session,
            params['lobbyName'],
          ),
        ),
        'gameLaunch': _i1.MethodConnector(
          name: 'gameLaunch',
          params: {
            'idLobby': _i1.ParameterDescription(
              name: 'idLobby',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lobbies'] as _i4.LobbiesEndpoint).gameLaunch(
            session,
            params['idLobby'],
          ),
        ),
      },
    );
    connectors['users'] = _i1.EndpointConnector(
      name: 'users',
      endpoint: endpoints['users']!,
      methodConnectors: {
        'deleteAllUsers': _i1.MethodConnector(
          name: 'deleteAllUsers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i5.UsersEndpoint).deleteAllUsers(session),
        ),
        'getAllUser': _i1.MethodConnector(
          name: 'getAllUser',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i5.UsersEndpoint).getAllUser(session),
        ),
        'createUser': _i1.MethodConnector(
          name: 'createUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i9.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i5.UsersEndpoint).createUser(
            session,
            params['user'],
          ),
        ),
        'deleteUser': _i1.MethodConnector(
          name: 'deleteUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i9.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i5.UsersEndpoint).deleteUser(
            session,
            params['user'],
          ),
        ),
        'getUser': _i1.MethodConnector(
          name: 'getUser',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i5.UsersEndpoint).getUser(
            session,
            params['username'],
          ),
        ),
        'changeNameUser': _i1.MethodConnector(
          name: 'changeNameUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i9.User>(),
              nullable: false,
            ),
            'newName': _i1.ParameterDescription(
              name: 'newName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i5.UsersEndpoint).changeNameUser(
            session,
            params['user'],
            params['newName'],
          ),
        ),
        'isExistingUser': _i1.MethodConnector(
          name: 'isExistingUser',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i5.UsersEndpoint).isExistingUser(
            session,
            params['username'],
          ),
        ),
        'changeMdp': _i1.MethodConnector(
          name: 'changeMdp',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'previousMdp': _i1.ParameterDescription(
              name: 'previousMdp',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newMdp': _i1.ParameterDescription(
              name: 'newMdp',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i5.UsersEndpoint).changeMdp(
            session,
            params['username'],
            params['previousMdp'],
            params['newMdp'],
          ),
        ),
        'enterIntoLobby': _i1.MethodConnector(
          name: 'enterIntoLobby',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'idLobby': _i1.ParameterDescription(
              name: 'idLobby',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i5.UsersEndpoint).enterIntoLobby(
            session,
            params['username'],
            params['idLobby'],
          ),
        ),
        'exitLobby': _i1.MethodConnector(
          name: 'exitLobby',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i5.UsersEndpoint).exitLobby(
            session,
            params['username'],
          ),
        ),
      },
    );
  }
}
