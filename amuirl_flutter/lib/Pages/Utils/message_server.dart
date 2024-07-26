import 'package:serverpod_serialization/src/serialization.dart';
import '../../main.dart';

class MessageServer {
  String msg;

  MessageServer({required this.msg});

  SerializableModel toJson() {
    return MessageServer(msg: msg).toJson();
  }


  Future<void> openStream() async {
    await client.openStreamingConnection();
    await for (var message in client.lobbies.stream) {
    }
  }
}