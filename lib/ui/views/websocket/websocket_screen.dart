import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:my_websocket_app/ui/views/websocket/websocket_viewmodel.dart';
import 'package:stacked/stacked.dart';

class WebSocketScreenView extends StatelessWidget {
  const WebSocketScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WebSocketViewModel>.reactive(
      viewModelBuilder: () => WebSocketViewModel(),
      builder: (context, viewModel, child) => ThemeSwitchingArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(viewModel.title),
            elevation: 0,
            leading: ThemeSwitcher.withTheme(
              builder: (_, switcher, theme) => InkWell(
                onTap: () => switcher.changeTheme(
                    theme: theme.brightness == Brightness.light
                        ? ThemeData.dark()
                        : ThemeData.light()),
                child: Icon(
                  theme.brightness == Brightness.light
                      ? Icons.nightlight
                      : Icons.wb_sunny,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  child: TextFormField(
                    controller: viewModel.controller,
                    decoration:
                        const InputDecoration(labelText: 'Send a message'),
                  ),
                ),
                const SizedBox(height: 24),
                // StreamBuilder(
                //   stream: viewModel.channel.stream,
                //   builder: (context, snapshot) {
                //     return Text(snapshot.hasData ? '${snapshot.data}' : '');
                //   },
                // ),
                // FutureBuilder(
                //   future: viewModel.rxUser.first,
                //   builder: (context, snapshot) {
                //     return Text(snapshot.hasData ? '${snapshot.data}' : '');
                //   },
                // )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: viewModel.sendMessageBroadcast,
            tooltip: 'Send message',
            child: const Icon(Icons.send),
          ),
        ),
      ),
    );
  }
}
