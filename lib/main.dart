import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_websocket_app/app/app.bottomsheets.dart';
import 'package:my_websocket_app/app/app.dialogs.dart';
import 'package:my_websocket_app/app/app.locator.dart';
import 'package:my_websocket_app/app/app.router.dart';
import 'package:my_websocket_app/models/todo.adapter.dart';
import 'package:my_websocket_app/models/todo.dart';
import 'package:my_websocket_app/ui/common/app_colors.dart';
import 'package:my_websocket_app/ui/views/todos/todos_screen.dart';
import 'package:my_websocket_app/ui/views/websocket/websocket_screen.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await setupHive();

  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MyApp());
}

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox('todos');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const TodosScreenView(),
      home: const WebSocketScreenView(),
      theme: ThemeData.light(),
      title: 'Flutter Stacked Todos',
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: Theme.of(context).copyWith(
  //       primaryColor: kcBackgroundColor,
  //       focusColor: kcPrimaryColor,
  //       textTheme: Theme.of(context).textTheme.apply(
  //             bodyColor: Colors.black,
  //           ),
  //     ),
  //     initialRoute: Routes.startupView,
  //     onGenerateRoute: StackedRouter().onGenerateRoute,
  //     navigatorKey: StackedService.navigatorKey,
  //     navigatorObservers: [
  //       StackedService.routeObserver,
  //     ],
  //   );
  // }
}
