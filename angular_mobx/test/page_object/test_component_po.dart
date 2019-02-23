import 'dart:async';

import 'package:pageloader/pageloader.dart';

part 'test_component_po.g.dart';

@PageObject()
abstract class TestComponentPO {
  TestComponentPO();

  factory TestComponentPO.create(PageLoaderElement context) =
      $TestComponentPO.create;

  @ById('fullname')
  PageLoaderElement get _fullName;

  @ById('setLastNameBtn')
  PageLoaderElement get _button;

  Future<void> clickButton() => _button.click();
//
  @ById('unrelatedBtn')
  PageLoaderElement get _unrelatedBtn;

  Future<void> clickUnrelatedButton() => _unrelatedBtn.click();

  String get fullName => _fullName.visibleText;
}
