import 'package:flutter/material.dart';
import 'package:my_websocket_app/models/todo.dart';
import 'package:my_websocket_app/services/todo.services.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';

class TodosScreenViewModel extends ReactiveViewModel {
  final FocusNode _firstTodoFocusNode = FocusNode();
  final TodosService _todosService = locator<TodosService>();
  late final bool Function(String id) toggleStatus = _todosService.toggleStatus;
  late final bool Function(String id) removeTodo = _todosService.removeTodo;
  late final bool Function(String id, String text) updateTodoContent =
      _todosService.updateTodoContent;

  List<Todo> get todos => _todosService.todos;

  void newTodo() {
    _todosService.newTodo();
    _firstTodoFocusNode.requestFocus();
  }

  FocusNode? getFocusNode(String id) {
    final int index = todos.indexWhere((Todo todo) => todo.id == id);
    return index == 0 ? _firstTodoFocusNode : null;
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_todosService];
}
