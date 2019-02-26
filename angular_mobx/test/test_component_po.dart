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

  @ByTagName('button')
  PageLoaderElement get _button;

  Future<void> clickButton() => _button.click();

  String get fullName => _fullName.visibleText;
}
