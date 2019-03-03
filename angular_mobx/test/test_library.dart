import 'package:angular_test/angular_test.dart';
import 'package:pageloader/html.dart';
import 'package:test/test.dart';
import 'stores/test_store.dart';
import 'page_object/test_component_po.dart';

NgTestFixture fixture;
TestComponentPO po;

void basicTests(NgTestBed testBed, {SyncFn syncFunc = noOpExecuteSyncedFn}) {
  setUp(() async {
    globalStore = TestStore();
    clearGlobalCounters();
    fixture = await testBed.create();
    final context = HtmlPageLoaderElement.createFromElement(fixture.rootElement,
        externalSyncFn: syncFunc);
    po = TestComponentPO.create(context);
  });

  tearDown(disposeAnyRunningTest);
  test('Should have corrent initial content', () async {
    expect(await po.fullName, 'James Bond');
  });

  test('Should recompute on button click', () async {
    expect(fullNameCalculations, 1);
    await po.clickButton();
    expect(fullNameCalculations, 2);
    expect(await po.fullName, 'James Dean');
  });
  test('Should not recompute on access to html element with computed value',
      () async {
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
  test('Checkbox click', () async {
    expect(po.isAdultChecked, isFalse,
        reason: 'initial value should be `false`');
    expect(globalStore.isAdult, isFalse);
    await po.clickIsAdultCheck();
    expect(po.isAdultChecked, isTrue,
        reason: 'Click on checkbox shoud toggle the value');
    expect(globalStore.isAdult, isTrue);
  });
  test('Checkbox checked property should react on store changes', () async {
    expect(globalStore.isAdult, isFalse);
    globalStore.toggleAdult();
    expect(
      po.isAdultChecked,
      isTrue,
    );
    expect(globalStore.isAdult, isTrue);
  });
}
