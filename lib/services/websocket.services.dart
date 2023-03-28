import 'package:stacked/stacked.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService with ListenableServiceMixin {
  late WebSocketChannel channelUser1;
  late final url1;
  late final rxUser1;
  final String urlPrefix = 'ws://localhost:8888';

  //  = WebSocketChannel.connect(
  //   // Uri.parse('wss://echo.websocket.events'),
  //   Uri.parse('ws://localhost:8888/rooms'),
  // );

  WebSocketService() {
    // final url = Uri.parse('$urlPrefix/rooms');
    url1 = Uri.parse('$urlPrefix/chat?user=user1');
    channelUser1 = WebSocketChannel.connect(url1);
    rxUser1 = channelUser1.stream.asBroadcastStream();
    // const port = 8888;
    // const urlPrefix = 'ws://localhost:$port';
    // final url2 = Uri.parse('$urlPrefix/chat?user=user2');
    // final user1 = WebSocketChannel.connect(url1);
    // final user2 = WebSocketChannel.connect(url2);
    // final rxUser1 = user1.stream.asBroadcastStream();
    // final rxUser2 = user2.stream.asBroadcastStream();

    // const sentMsg1 = "hello user 2";
    // const send1 = '{"to": "user2", "msg": "$sentMsg1"}';

    // user1.sink.add(send1);
    // final msg = await rxUser2.first;
  }

  void sendMessage(String message) {
    final send1 = '{"to": "user1", "msg": "$message"}';
    channelUser1.sink.add(send1);
  }

  void sendMessageBroadcast(String message) {
    if (channelUser1 != null && channelUser1.closeCode != null) {
      channelUser1 = WebSocketChannel.connect(url1);
    }
    final send1 = '{"to": "broadcast", "msg": "$message"}';
    channelUser1.sink.add(send1);
  }

  void close() {
    channelUser1.sink.close();
  }
}
