import 'package:mobx/mobx.dart';

part 'todo.g.dart';

class Todo = _Todo with _$Todo;

abstract class _Todo implements Store {
  _Todo(this.description, this.done);

  @observable
  String description = '';

  @observable
  bool done = false;

  @observable
  bool editing = false;

}

class TodoSerializer {
  static Todo fromJson(dynamic json) {
    return Todo(
      json['description'] as String,
      json['done'] as bool,
    );
  }

  static Map<String, dynamic> toJson(Todo value) {
    var result = <String, dynamic>{};
    result['description'] = value.description;
    result['done'] = value.done;
    return result;
  }
}
