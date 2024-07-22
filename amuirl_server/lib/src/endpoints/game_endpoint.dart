import 'package:amuirl_server/src/generated/latitudelongitude.dart';
import 'package:serverpod/server.dart';
import '../generated/game.dart';

class GameEndpoint extends Endpoint {
  Future<void> createGame(Session session, Game game) async {
    await Game.db.insertRow(session, game);
  }

  Future<void> deleteGame(Session session, Game game) async {
    await Game.db.deleteRow(session, game);
  }

  Future<Game?> getGame(Session session, String nameGame) async {
    return Game.db.findFirstRow(
      session,
      where: (t) => t.name.equals(nameGame),
    );
  }

  Future<bool?> killPlayer(Session session, String nameGame, String playerName) async {
    Game? game = await getGame(session, nameGame);
    if (game != null) {
      if (game.players.contains(playerName)) {
        bool res = false;
        int index = game.players.indexOf(playerName);
        game.playersDead.add(playerName);
        if (game.indexOfImpostors.contains(index)) {
          res = game.indexOfImpostors.remove(index);
        }
        await Game.db.updateRow(session, game);
        return res;
      }
    }
    return null;
  }

  Future<bool?> isDeadPlayer(Session session, String nameGame, String playerName) async {
    Game? game = await getGame(session, nameGame);
    if (game != null) {
      return game.playersDead.contains(playerName);
    }
    return null;
  }

  Future<List<String>?> getImpostors(Session session, String nameGame) async {
    Game? game = await getGame(session, nameGame);
    if (game != null) {
      List<String> result = <String>[];
      for (int i = 0; i < game.indexOfImpostors.length; i++) {
        result.add(game.players[game.indexOfImpostors[i]]);
      }
      return result;
    }

    return null;
  }

  List<int> getRatioPlayerImpostorStatus(Game game) {
    int totalPlayer = game.players.length;
    int impostorLeft = game.indexOfImpostors.length;
    int totalPlayerDead = game.playersDead.length;
    int crewmateSafeLeft = totalPlayer - impostorLeft - totalPlayerDead;
    return <int>[crewmateSafeLeft, impostorLeft];
  }

  Future<bool> finishTask(Session session, String nameGame, String playerName, LatitudeLongitude task) async {
    Game? game = await getGame(session, nameGame);
    if (game != null) {
      int playerIndex = game.players.indexOf(playerName);
      if (playerIndex != -1) {
        return game.taskLeftForEachPlayers[playerIndex].remove(task);
      }
    }
    return false;
  }

  Future<void> triggerLobby(Session session, String nameGame) async {
    Game? game = await getGame(session, nameGame);
    if (game != null) {
      game.startedPointTriggered = true;
      await Game.db.updateRow(session, game);
    }
  }

  Future<bool?> isTriggeredLobby(Session session, String nameGame) async {
    Game? game = await getGame(session, nameGame);
    if (game != null) {
      return game.startedPointTriggered;
    }
    return null;
  }

  Future<void> dangerActivatedOrDesactivated(Session session, String nameGame, bool changementStatus) async {
    Game? game = await getGame(session, nameGame);
    if (game != null) {
      game.dangerTriggered = changementStatus;
      await Game.db.updateRow(session, game);
    }
  }

  Future<bool?> isDangerLaunched(Session session, String nameGame) async {
    Game? game = await getGame(session, nameGame);
    if (game != null) {
      return game.dangerTriggered;
    }
    return null;
  }

  Future<List<String>?> getAllPlayer(Session session, String nameGame) async {
    Game? game = await getGame(session, nameGame);
    if (game != null) {
      return game.players;
    }
    return null;
  }

  Future<List<int>?> getGameParameters(Session session, String nameGame) async {
    Game? game = await getGame(session, nameGame);
    if (game != null) {
      return game.gameParameter;
    }

    return null;
  }

  Future<int> getGameTotalTaskLeft(Session session, String nameGame) async {
    Game? game = await getGame(session, nameGame);
    if (game != null) {
      int count = 0;
      for (int i =0; i < game.taskLeftForEachPlayers.length; i++) {
        count += game.taskLeftForEachPlayers[i].length;
      }
      return count;
    }

    return -1;
  }

  Future<void> testIfGameEnded(Session session, String nameGame) async {
    Game? game = await getGame(session, nameGame);
    if (game != null) {
      int taskLeft = await getGameTotalTaskLeft(session, nameGame);
      if (taskLeft == 0) {
        game.isGameEnded = true;
        await Game.db.updateRow(session, game);
        return;
      }

      List<int> playersLeft = getRatioPlayerImpostorStatus(game);
      if (playersLeft[0] <= playersLeft[1] || playersLeft[1] == 0) {
        game.isGameEnded = true;
        await Game.db.updateRow(session, game);
        return;
      }
    }
  }
}