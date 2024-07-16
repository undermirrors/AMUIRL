import 'package:serverpod/database.dart';
import 'package:serverpod/server.dart';
import '../generated/protocol.dart';

class LobbiesEndpoint extends Endpoint {
  Future<void> deleteAllLobbies(Session session) async {
    await Lobby.db.delete(session, await getAllLobby(session));
  }

  Future<void> createLobby(Session session, Lobby lobby) async {
    await Lobby.db.insertRow(session, lobby);
  }

  Future<void> deleteLobby(Session session, Lobby lobby) async {
    while (lobby.nbPlayer != 0) {
      var username = lobby.players[0];

      // We push player out of lobby
      var user = await User.db.findFirstRow(session, where: (t) => t.name.equals(username));
      if (user != null) {
        user.currentlobby = 0;
        await User.db.updateRow(session, user);
      }

      lobby.players.remove(username);
      lobby.nbPlayer--;
    }
    await Lobby.db.deleteRow(session, lobby);
  }

  Future<String> addPlayer(Session session, int idLobby, User user) async {
    var res = "";
    var lobby = await Lobby.db.findById(
        session, idLobby
    );
    if (lobby != null) {
      res = "lobby not null";
      if (!lobby.players.contains(user.name)) {
        lobby.players.add(user.name);
        lobby.nbPlayer = lobby.players.length;
        res += " and player added in the function !";
        var lobbytwin = await Lobby.db.updateRow(session, lobby);
        res += " The lobby have now ${lobbytwin.players}";
      } else {
        res += " but player already exist in the table";
      }
    } else {
      res = "little problem occured";
    }
    return res;
  }

  Future<String> suppressPlayer(Session session, int idLobby, User user) async {
    String res = "";
    var lobby = await Lobby.db.findById(session, idLobby);
    if (lobby != null) {
      if (lobby.players.remove(user.name)) {
        lobby.nbPlayer = lobby.players.length;
        res += "player suppressed from lobby";
      } else {

        res += "player not suppressed from lobby";
      }
      user.currentlobby = 0;
      await User.db.updateRow(session, user);
      if (lobby.nbPlayer == 0) {
        deleteLobby(session, lobby);
      } else {
        await Lobby.db.updateRow(session, lobby);
      }
    }

    return res;
  }

  Future<List<Lobby>> getAllLobby(Session session, {String? keyword}) async {
    return await Lobby.db.find(
      session,
      where: (t) =>
      keyword != null ? t.name.like('%$keyword%') : Constant.bool(true),
      orderBy: (t) => t.id,
    );
  }


  Future<void> changeParameter(Session session, Lobby lobby, List<int> parameters) async {
    Lobby newLobby = lobby;
    newLobby.gameParameter = parameters;
    Lobby.db.updateRow(session, newLobby);
  }

  Future<Lobby?> getLobby(Session session, int idLobby) async {
    return await Lobby.db.findById(session, idLobby);
  }


  Future<bool> lobbyExist(Session session, Lobby lobbyName) async {
    var lobby = await Lobby.db.findFirstRow(
        session, where: (t) => t.name.equals(lobbyName.name));
    if (lobby == null) {
      return false;
    }
    return true;
  }
}