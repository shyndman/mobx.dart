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
  Computed<bool> _$waitingForNetworkComputed;

  @override
  bool get waitingForNetwork => (_$waitingForNetworkComputed ??=
          Computed<bool>(() => super.waitingForNetwork))
      .value;
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
  String get storeStatusString => (_$statusDescriptionComputed ??=
          Computed<String>(() => super.storeStatusString))
      .value;
  Computed<StoreStatus> _$statusComputed;

  @override
  StoreStatus get status =>
      (_$statusComputed ??= Computed<StoreStatus>(() => super.status)).value;

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

  final _$waitingForKeyboardAtom =
      Atom(name: '_GithubStore.waitingForKeyboard');

  @override
  bool get waitingForKeyboard {
    _$waitingForKeyboardAtom.reportObserved();
    return super.waitingForKeyboard;
  }

  @override
  set waitingForKeyboard(bool value) {
    mainContext.checkIfStateModificationsAreAllowed(_$waitingForKeyboardAtom);
    super.waitingForKeyboard = value;
    _$waitingForKeyboardAtom.reportChanged();
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

  final _$isRepositoryListEmptyAtom =
      Atom(name: '_GithubStore.isRepositoryListEmpty');

  @override
  bool get isRepositoryListEmpty {
    _$isRepositoryListEmptyAtom.reportObserved();
    return super.isRepositoryListEmpty;
  }

  @override
  set isRepositoryListEmpty(bool value) {
    mainContext
        .checkIfStateModificationsAreAllowed(_$isRepositoryListEmptyAtom);
    super.isRepositoryListEmpty = value;
    _$isRepositoryListEmptyAtom.reportChanged();
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
