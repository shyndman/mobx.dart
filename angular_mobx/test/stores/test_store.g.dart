// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies

mixin _$TestStore on _TestStore, Store {
  Computed<String> _$fullNameComputed;

  @override
  String get fullName =>
      (_$fullNameComputed ??= Computed<String>(() => super.fullName)).value;

  final _$firstNameAtom = Atom(name: '_TestStore.firstName');

  @override
  String get firstName {
    _$firstNameAtom.reportObserved();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    mainContext.checkIfStateModificationsAreAllowed(_$firstNameAtom);
    super.firstName = value;
    _$firstNameAtom.reportChanged();
  }

  final _$lastNameAtom = Atom(name: '_TestStore.lastName');

  @override
  String get lastName {
    _$lastNameAtom.reportObserved();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    mainContext.checkIfStateModificationsAreAllowed(_$lastNameAtom);
    super.lastName = value;
    _$lastNameAtom.reportChanged();
  }

  final _$_TestStoreActionController = ActionController(name: '_TestStore');

  @override
  dynamic setNames(String firstName, String lastName) {
    final _$actionInfo = _$_TestStoreActionController.startAction();
    try {
      return super.setNames(firstName, lastName);
    } finally {
      _$_TestStoreActionController.endAction(_$actionInfo);
    }
  }
}
