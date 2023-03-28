import 'package:flutter/material.dart';
import 'package:my_websocket_app/services/websocket.services.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';

class WebSocketViewModel extends ReactiveViewModel {
  final WebSocketService _webSocketService = locator.get<WebSocketService>();

  final title = 'WebSocket Demo';
  final TextEditingController controller = TextEditingController();

  late final channel = _webSocketService.channelUser1;
  late final rxUser = _webSocketService.rxUser1;

  late final void Function() sendMessage =
      () => _webSocketService.sendMessage(controller.text);
  late final void Function() sendMessageBroadcast =
      () => _webSocketService.sendMessageBroadcast(controller.text);

  @override
  void dispose() {
    channel.sink.close();
    controller.dispose();
    super.dispose();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_webSocketService];
}
