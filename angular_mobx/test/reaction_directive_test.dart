@TestOn('browser')

import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';

import 'components/test_reaction_component.dart';
import 'components/test_reaction_component.template.dart' as ng;
import 'test_library.dart';


void main() {
  final testBed =
  NgTestBed.forComponent<TestReactionComponent>(ng.TestReactionComponentNgFactory);
  ng.initReflector();
  group('mobxReaction', ()=>basicTests(testBed));
}
