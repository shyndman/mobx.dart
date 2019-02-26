// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_component_po.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
class $TestComponentPO extends TestComponentPO with $$TestComponentPO {
  PageLoaderElement $__root__;
  $TestComponentPO.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $TestComponentPO.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
      "TestComponentPO is not generated and can only be used on Page Object "
      "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "TestComponentPO". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String get fullName {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('TestComponentPO', 'fullName');
    }
    final returnMe = super.fullName;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('TestComponentPO', 'fullName');
    }
    return returnMe;
  }

  Future<void> clickButton() {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('TestComponentPO', 'clickButton');
    }
    final returnMe = super.clickButton();
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('TestComponentPO', 'clickButton');
    }
    return returnMe;
  }
}

class $$TestComponentPO {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__; // ignore: unused_field
  PageLoaderElement get $root => $__root__;
  PageLoaderElement get _fullName {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('TestComponentPO', '_fullName');
    }
    final element = $__root__.createElement(ById('fullname'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('TestComponentPO', '_fullName');
    }
    return returnMe;
  }

  PageLoaderElement get _button {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('TestComponentPO', '_button');
    }
    final element = $__root__.createElement(ByTagName('button'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('TestComponentPO', '_button');
    }
    return returnMe;
  }
}
