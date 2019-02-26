@TestOn('browser')
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';

import 'components/test_mobx_manual_component.dart';
import 'components/test_mobx_manual_component.template.dart' as ng;
import 'test_library.dart';


void main() {

  final testBed = NgTestBed.forComponent<TestMobxManualComponent>(
      ng.TestMobxManualComponentNgFactory);
  ng.initReflector();
  group('MobxManual', () => basicTests(testBed));
}
