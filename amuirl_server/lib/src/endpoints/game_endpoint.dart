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
        game.playersDead.add(playerName);
        if (game.indexOfImpostors.contains(playerName)) {
          res = game.indexOfImpostors.remove(playerName);
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
      return game.indexOfImpostors;
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

  Future<List<LatitudeLongitude?>?> getPlayersPosition(Session session, String nameGame) async {
    Game? game = await getGame(session, nameGame);
    if (game != null) {
      return game.playersPosition;
    }
    return null;
  }

  Future<void> updatePlayerPosition(Session session, String nameGame, String playerName, LatitudeLongitude newPos) async {
    Game? game = await getGame(session, nameGame);
    if (game != null) {
      int index = game.players.indexOf(playerName);
      if (index != -1) {
        game.playersPosition[index] = newPos;
        await Game.db.updateRow(session, game);
      }
    }
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


  // Todo : make a function for send alert
}