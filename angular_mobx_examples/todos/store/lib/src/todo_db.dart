import 'todo.dart';

abstract class TodoDb {
  List<Todo> load();

  void save(List<Todo> value);
}

class MockTodoDb extends TodoDb {
  List<Todo> content = [];

  List<Todo> load() {
    return content;
  }

  void save(List<Todo> value) {
    content = value;
  }
}
