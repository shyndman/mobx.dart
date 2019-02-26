import 'package:angular/angular.dart';
import 'package:mobx/mobx.dart';

import 'mobx_autorun_directive.dart';

@Directive(selector: '[mobxReaction]')
class MobxReaction extends MobxAutorun {
  dynamic Function(Reaction) _reaction;

  @Input()
  set mobxReaction(dynamic Function(Reaction) value) {
    _reaction = value;
  }

  MobxReaction(TemplateRef templateRef, ViewContainerRef viewContainer)
      : super(templateRef, viewContainer);
  void createReaction() {
    dispose = reaction(_reaction, (_) {
      view.detectChanges();
    });
  }
}
