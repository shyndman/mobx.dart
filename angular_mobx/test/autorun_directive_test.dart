@TestOn('browser')

import 'package:angular_test/angular_test.dart';
import 'package:pageloader/html.dart';
import 'package:test/test.dart';

import 'components/test_autorun_component.dart';
import 'components/test_autorun_component.template.dart' as ng;
import 'stores/test_store.dart';

import 'test_component_po.dart';

NgTestFixture<TestAutorunComponent> fixture;
TestComponentPO po;

void main() {
  final testBed =
  NgTestBed.forComponent<TestAutorunComponent>(ng.TestAutorunComponentNgFactory);
  ng.initReflector();
  setUp(() async {
    globalStore = TestStore();
    clearGlobalCounters();
    fixture = await testBed.create();
    final context =
    HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    po = TestComponentPO.create(context);
  });

  tearDown(disposeAnyRunningTest);

  group('Basics:', basicTests);
}

void basicTests() {
  test('Should have corrent initial content', () async {
    expect(await po.fullName, 'James Bond');
  });

  test('Should recompute on button click', () async {
    expect(fullNameCalculations, 1);
    await po.clickButton();
    expect(fullNameCalculations, 2);
    expect(await po.fullName, 'James Dean');
  });
  test('Should not recompute on access to html element with computed value', () async {
    expect(fullNameCalculations, 1);
    expect(await po.fullName, 'James Bond');
    expect(fullNameCalculations, 1);
    expect(await po.fullName, 'James Bond');
    expect(await po.fullName, 'James Bond');
    expect(await po.fullName, 'James Bond');
    expect(await po.fullName, 'James Bond');
    expect(fullNameCalculations, 1);
  });
  test('Should change content on external change', () async {
    expect(await po.fullName, 'James Bond');
    expect(fullNameCalculations, 1);
    globalStore.setNames('Robert', 'Dean');
    expect(await po.fullName, 'Robert Dean');
    expect(fullNameCalculations, 2);
  });
  test('Should recompute value on each action', () async {
    expect(fullNameCalculations, 1);
    globalStore.setNames('Robert', 'Dean');
    globalStore.setNames('Robert', 'Dean');
    expect(fullNameCalculations, 3);
  });
  test('Should not recompute on unrelated input from outside', () async {
    expect(fullNameCalculations, 1);
    await po.clickUnrelatedButton();
    await po.clickUnrelatedButton();
    await po.clickUnrelatedButton();
    expect(fullNameCalculations, 1);
  });
}