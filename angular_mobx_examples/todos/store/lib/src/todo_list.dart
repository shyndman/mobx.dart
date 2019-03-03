import 'package:mobx/mobx.dart';
import 'todo.dart';
import 'todo_db.dart';

part 'todo_list.g.dart';

enum VisibilityFilter { all, pending, completed }

class TodoList = _TodoList with _$TodoList;

abstract class _TodoList implements Store {
  TodoDb todoDb;

  _TodoList(this.todoDb) {
    _loadFromDb();
  }

  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @observable
  VisibilityFilter filter = VisibilityFilter.all;

  @observable
  String currentDescription = '';

  @computed
  ObservableList<Todo> get pendingTodos =>
      ObservableList.of(todos.where((todo) => todo.done != true));

  @computed
  ObservableList<Todo> get completedTodos =>
      ObservableList.of(todos.where((todo) => todo.done == true));

  @computed
  bool get hasCompletedTodos => completedTodos.isNotEmpty;

  @computed
  bool get hasPendingTodos => pendingTodos.isNotEmpty;

  @computed
  String get itemsDescription {
    if (todos.isEmpty) {
      return "There are no Todos here.";
    }

    final suffix = pendingTodos.length == 1 ? 'todo' : 'todos';
    return '${pendingTodos.length} pending $suffix, ${completedTodos.length} done';
  }

  @computed
  ObservableList<Todo> get visibleTodos {
    switch (filter) {
      case VisibilityFilter.pending:
        return pendingTodos;
      case VisibilityFilter.completed:
        return completedTodos;
      default:
        return todos;
    }
  }

  @computed
  bool get canRemoveAllCompleted =>
      hasCompletedTodos && filter != VisibilityFilter.pending;

  @computed
  bool get canMarkAllCompleted =>
      hasPendingTodos && filter != VisibilityFilter.completed;

  @computed
  bool get allTasksAreCompleted => !hasPendingTodos && hasCompletedTodos;

  @action
  void addTodo(String description) {
    if (description == null || description == '') {
      return;
    }
    final todo = Todo(description, false);
    todos.add(todo);
    currentDescription = '';
    _saveToDb();
  }

  @action
  void removeTodo(Todo todo) {
    todos.removeWhere((x) => x == todo);
    _saveToDb();
  }

  @action
  void changeDescription(String description) =>
      currentDescription = description;

  @action
  void changeFilter(VisibilityFilter filter) => this.filter = filter;

  @action
  void removeCompleted() {
    todos.removeWhere((todo) => todo.done);
    _saveToDb();
  }

  @action
  void markAllAsCompleted() {
    for (final todo in todos) {
      todo.done = true;
    }
    _saveToDb();
  }

  @action
  void batchedToggleCompletion() {
    if (allTasksAreCompleted) {
      for (final todo in todos) {
        todo.done = false;
      }
    } else {
      for (final todo in todos) {
        todo.done = true;
      }
    }
    _saveToDb();
  }

  @observable
  Todo editedTodo;

  @action
  void startEditing(Todo todo) {
    cancelEditing();
    todo.editing = true;
    editedTodo = todo;
  }

  @action
  void cancelEditing() {
    if (editedTodo != null) {
      editedTodo.editing = false;
    }
    editedTodo = null;
  }

  @action
  void saveEditing(Todo todo, String newDescription) {
    if (!todo.editing) {
      return;
    }
    todo.description = newDescription;
    cancelEditing();
    if ((todo.description ?? '') == '') {
      todos.remove(todo);
    }
    _saveToDb();
  }

  @action
  void toggleStatus(Todo todo) {
    todo.done = !todo.done;
    todoDb.save(todos);
  }

  @action
  Future<void> _loadFromDb() async {
    todos.clear();
    var savedData = await todoDb.load();
    todos.addAll(savedData);
  }

  Future<void> _saveToDb() {
    todoDb.save(todos);
  }
}
