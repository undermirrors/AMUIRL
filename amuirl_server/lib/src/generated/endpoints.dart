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
import '../endpoints/lobbies_endpoint.dart' as _i3;
import '../endpoints/users_endpoint.dart' as _i4;
import 'package:amuirl_server/src/generated/lobbies.dart' as _i5;
import 'package:amuirl_server/src/generated/users.dart' as _i6;

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
      'lobbies': _i3.LobbiesEndpoint()
        ..initialize(
          server,
          'lobbies',
          null,
        ),
      'users': _i4.UsersEndpoint()
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
              (endpoints['lobbies'] as _i3.LobbiesEndpoint)
                  .deleteAllLobbies(session),
        ),
        'createLobby': _i1.MethodConnector(
          name: 'createLobby',
          params: {
            'lobby': _i1.ParameterDescription(
              name: 'lobby',
              type: _i1.getType<_i5.Lobby>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lobbies'] as _i3.LobbiesEndpoint).createLobby(
            session,
            params['lobby'],
          ),
        ),
        'deleteLobby': _i1.MethodConnector(
          name: 'deleteLobby',
          params: {
            'lobby': _i1.ParameterDescription(
              name: 'lobby',
              type: _i1.getType<_i5.Lobby>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lobbies'] as _i3.LobbiesEndpoint).deleteLobby(
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
              type: _i1.getType<_i6.User>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lobbies'] as _i3.LobbiesEndpoint).addPlayer(
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
              type: _i1.getType<_i6.User>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lobbies'] as _i3.LobbiesEndpoint).suppressPlayer(
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
              (endpoints['lobbies'] as _i3.LobbiesEndpoint).getAllLobby(
            session,
            keyword: params['keyword'],
          ),
        ),
        'changeParameter': _i1.MethodConnector(
          name: 'changeParameter',
          params: {
            'lobby': _i1.ParameterDescription(
              name: 'lobby',
              type: _i1.getType<_i5.Lobby>(),
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
              (endpoints['lobbies'] as _i3.LobbiesEndpoint).changeParameter(
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
              (endpoints['lobbies'] as _i3.LobbiesEndpoint).getLobby(
            session,
            params['idLobby'],
          ),
        ),
        'lobbyExist': _i1.MethodConnector(
          name: 'lobbyExist',
          params: {
            'lobbyName': _i1.ParameterDescription(
              name: 'lobbyName',
              type: _i1.getType<_i5.Lobby>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lobbies'] as _i3.LobbiesEndpoint).lobbyExist(
            session,
            params['lobbyName'],
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
              (endpoints['users'] as _i4.UsersEndpoint).deleteAllUsers(session),
        ),
        'getAllUser': _i1.MethodConnector(
          name: 'getAllUser',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i4.UsersEndpoint).getAllUser(session),
        ),
        'createUser': _i1.MethodConnector(
          name: 'createUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i6.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i4.UsersEndpoint).createUser(
            session,
            params['user'],
          ),
        ),
        'deleteUser': _i1.MethodConnector(
          name: 'deleteUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i6.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i4.UsersEndpoint).deleteUser(
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
              (endpoints['users'] as _i4.UsersEndpoint).getUser(
            session,
            params['username'],
          ),
        ),
        'changeNameUser': _i1.MethodConnector(
          name: 'changeNameUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i6.User>(),
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
              (endpoints['users'] as _i4.UsersEndpoint).changeNameUser(
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
              (endpoints['users'] as _i4.UsersEndpoint).isExistingUser(
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
              (endpoints['users'] as _i4.UsersEndpoint).changeMdp(
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
              (endpoints['users'] as _i4.UsersEndpoint).enterIntoLobby(
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
              (endpoints['users'] as _i4.UsersEndpoint).exitLobby(
            session,
            params['username'],
          ),
        ),
      },
    );
  }
}
