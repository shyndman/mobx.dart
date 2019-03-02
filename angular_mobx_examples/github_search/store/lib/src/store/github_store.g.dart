// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies

mixin _$GithubStore on _GithubStore, Store {
  Computed<bool> _$hasResultsComputed;

  @override
  bool get hasResults =>
      (_$hasResultsComputed ??= Computed<bool>(() => super.hasResults)).value;
  Computed<bool> _$isPendingComputed;

  @override
  bool get isPending =>
      (_$isPendingComputed ??= Computed<bool>(() => super.isPending)).value;
  Computed<bool> _$resultIsEmptyComputed;

  @override
  bool get resultIsEmpty =>
      (_$resultIsEmptyComputed ??= Computed<bool>(() => super.resultIsEmpty))
          .value;
  Computed<bool> _$isRejectedComputed;

  @override
  bool get isRejected =>
      (_$isRejectedComputed ??= Computed<bool>(() => super.isRejected)).value;
  Computed<String> _$statusDescriptionComputed;

  @override
  String get statusDescription => (_$statusDescriptionComputed ??=
          Computed<String>(() => super.statusDescription))
      .value;

  final _$searchTokenAtom = Atom(name: '_GithubStore.searchToken');

  @override
  String get searchToken {
    _$searchTokenAtom.reportObserved();
    return super.searchToken;
  }

  @override
  set searchToken(String value) {
    mainContext.checkIfStateModificationsAreAllowed(_$searchTokenAtom);
    super.searchToken = value;
    _$searchTokenAtom.reportChanged();
  }

  final _$waitingForInputCompletionAtom =
      Atom(name: '_GithubStore.waitingForInputCompletion');

  @override
  bool get waitingForInputCompletion {
    _$waitingForInputCompletionAtom.reportObserved();
    return super.waitingForInputCompletion;
  }

  @override
  set waitingForInputCompletion(bool value) {
    mainContext
        .checkIfStateModificationsAreAllowed(_$waitingForInputCompletionAtom);
    super.waitingForInputCompletion = value;
    _$waitingForInputCompletionAtom.reportChanged();
  }

  final _$fetchReposFutureAtom = Atom(name: '_GithubStore.fetchReposFuture');

  @override
  ObservableFuture get fetchReposFuture {
    _$fetchReposFutureAtom.reportObserved();
    return super.fetchReposFuture;
  }

  @override
  set fetchReposFuture(ObservableFuture value) {
    mainContext.checkIfStateModificationsAreAllowed(_$fetchReposFutureAtom);
    super.fetchReposFuture = value;
    _$fetchReposFutureAtom.reportChanged();
  }

  final _$isEmptyAtom = Atom(name: '_GithubStore.isEmpty');

  @override
  bool get isEmpty {
    _$isEmptyAtom.reportObserved();
    return super.isEmpty;
  }

  @override
  set isEmpty(bool value) {
    mainContext.checkIfStateModificationsAreAllowed(_$isEmptyAtom);
    super.isEmpty = value;
    _$isEmptyAtom.reportChanged();
  }

  final _$fetchReposAsyncAction = AsyncAction('fetchRepos');

  @override
  Future<void> fetchRepos() {
    return _$fetchReposAsyncAction.run(() => super.fetchRepos());
  }

  final _$_GithubStoreActionController = ActionController(name: '_GithubStore');

  @override
  void setSearchToken(String text) {
    final _$actionInfo = _$_GithubStoreActionController.startAction();
    try {
      return super.setSearchToken(text);
    } finally {
      _$_GithubStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRepositories(List<SearchResultItem> value) {
    final _$actionInfo = _$_GithubStoreActionController.startAction();
    try {
      return super.setRepositories(value);
    } finally {
      _$_GithubStoreActionController.endAction(_$actionInfo);
    }
  }
}
