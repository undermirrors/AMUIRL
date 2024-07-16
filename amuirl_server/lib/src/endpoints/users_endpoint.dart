import 'package:serverpod/server.dart';
import '../generated/users.dart';


class UsersEndpoint extends Endpoint {
  Future<void> deleteAllUsers(Session session) async {
    var allUser = await getAllUser(session);
    await User.db.delete(session, allUser);
  }

  Future<List<User>> getAllUser(Session session) async {
    return User.db.find(session, orderBy: (t) => t.id);
  }

  Future<void> createUser(Session session, User user) async {
    await User.db.insertRow(session, user);
  }

  Future<void> deleteUser(Session session, User user) async {
    await User.db.deleteRow(session, user);
  }

  Future<User?> getUser(Session session, String username) async {
    return User.db.findFirstRow(
      session,
      where: (t) => t.name.equals(username),
    );
  }

  // Be sure newName is a name which not already exist in the server database
  Future<void> changeNameUser(Session session, User user, String newName) async {
    User newUser = user;
    newUser.name = newName;
    await User.db.insertRow(session, newUser);
    await User.db.deleteRow(session, user);
  }

  Future<bool> isExistingUser(Session session, String username) async {
    return (await User.db.findFirstRow(session, where: (t) => t.name.equals(username)) != null);
  }

  Future<String> changeMdp(Session session, String username, String previousMdp, String newMdp) async {
    var user = await getUser(session, username);
    if (user!= null) {
      if (user.mdp == previousMdp) {
        user.mdp = newMdp;
        await User.db.updateRow(session, user);
        return "Appliqué !!";
      }
    }

    return "Utilisateur ou mot de passe incorrect. Veuillez réessayer.";
  }

  Future<String> enterIntoLobby(Session session, String username, int idLobby) async {
    var user = await getUser(session, username);
    if (user != null) {
      user.currentlobby = idLobby;
      await User.db.updateRow(session, user);
      var userTest = await getUser(session, username);
      if (userTest != null) {
        return "done, user.currentLobby is ${userTest.currentlobby}";
      } else {
        return "error : user have a problem";
      }
    } else {
      return "error : user don't exist (don't suppose to happened)";
    }
  }

  Future<String> exitLobby(Session session, String username) async {
    var user = await getUser(session, username);
    if (user != null) {
      user.currentlobby = 0;
      return "done";
    } else {
      return "error : user don't exist (don't suppose to happened)";
    }
  }
}
