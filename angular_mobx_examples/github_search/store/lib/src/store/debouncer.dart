import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:stream_transform/stream_transform.dart';

class Debouncer {
  Function() _watcher;
  Function(dynamic) _action;
  int _debounceMilliseconds;
  ReactionDisposer _disposer;

  var _streamController = StreamController<void>();
  Stream<void> _debouncedStream;
  StreamSubscription<void> _streamSubscription;

  Debouncer(this._watcher, this._action, this._debounceMilliseconds) {
    _debouncedStream = _streamController.stream
        .transform(debounce(Duration(milliseconds: _debounceMilliseconds)));
    _streamSubscription = _debouncedStream.listen(_action);
    _disposer = autorun((_) {
      _watcher();
      _streamController.add(null);
    });
  }

  close() {
    _streamSubscription.cancel();
    _disposer();
    _streamController.close();
  }
}
