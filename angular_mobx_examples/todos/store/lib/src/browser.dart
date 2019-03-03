import 'dart:html';
import 'dart:convert';
import 'todo_db.dart';
import 'todo.dart';
import 'todo_list.dart';
import 'dart:developer';

const storageKey = 'angular_todos_example';

TodoList makeTodos() {
  var db = TodoDbBrowser();
  var result = TodoList(db);
  return result;
}

class TodoDbBrowser implements TodoDb {
  Future<List<Todo>> load() async {
    try {
      var content = window.localStorage[storageKey];
      if (content == null) {
        return [];
      }
      var jsonContent = (json.decode(content)) as List;
      var result = <Todo>[];
      for (var each in jsonContent) {
        var todo = TodoSerializer.fromJson(each);
        result.add(todo);
      }
      return result;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> save(List<Todo> value) async {
    var jsonContent = value.map((e) => TodoSerializer.toJson(e)).toList();
    window.localStorage[storageKey] = json.encode(jsonContent);
  }
}
