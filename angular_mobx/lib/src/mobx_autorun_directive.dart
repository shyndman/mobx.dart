import 'package:angular/angular.dart';
import 'package:mobx/mobx.dart';

@Directive(selector: '[mobxAutorun]')
class MobxAutorun implements OnInit, OnDestroy {
  TemplateRef templateRef;
  ViewContainerRef viewContainer;
  dynamic view;
  var dispose;
  String _autorunDescription;

  @Input()
  set mobxAutorun(String value) {
    _autorunDescription = value == '' ? null : value;
  }

  MobxAutorun(this.templateRef, this.viewContainer);

  @override
  ngOnInit() {
    if (dispose != null) {
      dispose();
    }
    view = viewContainer.createEmbeddedView(templateRef);
    createReaction();
  }
  @override
  ngOnDestroy() {
    if (dispose != null) {
      dispose();
    }
  }
  void createReaction() {
    dispose = autorun((_) {
      view.detectChanges();
      if (_autorunDescription != null) {
        print('Autorun $_autorunDescription');
      }
    }, name: _autorunDescription);
  }
}
