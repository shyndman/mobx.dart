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

  final _$repositoriesAtom = Atom(name: '_GithubStore.repositories');

  @override
  List<SearchResultItem> get repositories {
    _$repositoriesAtom.reportObserved();
    return super.repositories;
  }

  @override
  set repositories(List<SearchResultItem> value) {
    mainContext.checkIfStateModificationsAreAllowed(_$repositoriesAtom);
    super.repositories = value;
    _$repositoriesAtom.reportChanged();
  }

  final _$statusAtom = Atom(name: '_GithubStore.status');

  @override
  StoreStatus get status {
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(StoreStatus value) {
    mainContext.checkIfStateModificationsAreAllowed(_$statusAtom);
    super.status = value;
    _$statusAtom.reportChanged();
  }

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

  final _$errorAtom = Atom(name: '_GithubStore.error');

  @override
  String get error {
    _$errorAtom.reportObserved();
    return super.error;
  }

  @override
  set error(String value) {
    mainContext.checkIfStateModificationsAreAllowed(_$errorAtom);
    super.error = value;
    _$errorAtom.reportChanged();
  }

  final _$_GithubStoreActionController = ActionController(name: '_GithubStore');

  @override
  dynamic startSearch() {
    final _$actionInfo = _$_GithubStoreActionController.startAction();
    try {
      return super.startSearch();
    } finally {
      _$_GithubStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void completeWithSuccess(List<SearchResultItem> repos) {
    final _$actionInfo = _$_GithubStoreActionController.startAction();
    try {
      return super.completeWithSuccess(repos);
    } finally {
      _$_GithubStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(StoreStatus newStatus) {
    final _$actionInfo = _$_GithubStoreActionController.startAction();
    try {
      return super.setStatus(newStatus);
    } finally {
      _$_GithubStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchToken(String text) {
    final _$actionInfo = _$_GithubStoreActionController.startAction();
    try {
      return super.setSearchToken(text);
    } finally {
      _$_GithubStoreActionController.endAction(_$actionInfo);
    }
  }
}
