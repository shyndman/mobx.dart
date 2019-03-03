import 'todo.dart';

abstract class TodoDb {
  Future<List<Todo>> load();

  Future<void> save(List<Todo> value);
}

class MockTodoDb extends TodoDb {
  List<Todo> content = [];

  Future<List<Todo>> load() async {
    return content;
  }

  Future<void> save(List<Todo> value) async {
    content = value;
  }
}
