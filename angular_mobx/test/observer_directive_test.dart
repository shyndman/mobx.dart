@TestOn('browser')

import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';

import 'components/test_observer_component.dart';
import 'components/test_observer_component.template.dart' as ng;
import 'test_library.dart';


void main() {
  final testBed =
  NgTestBed.forComponent<TestAutorunComponent>(ng.TestAutorunComponentNgFactory);
  ng.initReflector();
  group('mobxAutorun', ()=>basicTests(testBed));
}

