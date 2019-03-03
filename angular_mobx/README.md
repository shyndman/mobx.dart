# angular-mobx

## MobX connector for AngularDart

## Features
1. The library allows you to automatically observe all the observables that your component uses
2. Automatically runs change detection - works great with OnPush strategy
3. Disposes of all the observers when the component is destroyed

## Usage

Add angular_mobx to your dependencies list

## observer
Use `*observer` directive in your template:
```Dart
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../store/counter.dart';
import 'package:angular_mobx/angular_mobx.dart';

@Component(
  selector: 'counter-page',
  template: '''
<div class="counter-page-container">
    <h1>Counter App</h1>
    <div *observer>
        <h2>Current Count: {{ counter.value}}</h2>
    </div>
    <material-fab class="counter-fab-button" (trigger)="counter.increment()">+</material-fab>
    <material-fab class="counter-fab-button" (trigger)="counter.decrement()">-</material-fab>
    <material-fab class="counter-fab-button" (trigger)="counter.startTimer()">start</material-fab>
    <material-fab class="counter-fab-button" (trigger)="counter.stopTimer()">stop</material-fab>
</div>
  ''',
  styleUrls: ['counter_page_component.css'],
  directives: [MaterialFabComponent, MobxObserver],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class CounterPageComponent {
  final Counter counter;

  CounterPageComponent(this.counter);
}
```
## Using with OnPush change detection strategy 
To achieve great performance, you probably should always set `OnPush` change detection strategy on your components (this can be configured as default in `.angular-cli.json`).
MobX will run change detection automatically for you on the components that need to be updated.

## Under the hood
In order to inject the change detector, and implement lifecycle hooks like ngOnDestroy, this library uses a AngularDart structural directive. (Idea is taken from [mobx-angular](https://github.com/mobxjs/mobx-angular) )l
In the mobx.dart ecosystem it is probably could be compared with `flutter_mobx Observer` widget, therefore directive is named `*observer`. Using structural directive approach also has the benefit of allowing you to easily have multiple observed sections of your component's template, in case it is required.

But unlike in Flutter, using structural directive in AngularDart has some ramifications.
One known to me described here: [ViewChildren class](https://webdev.dartlang.org/api/angular/angular/ViewChildren-class)

  >> **WARNING**: Queries such as [ViewChildren], [ContentChildren] and related
     are only meant to be used on _static_ content in the template. For example
     writing a custom structural directive (like `*ngIf`) that changes the
     structure of the DOM in custom ways will not work properly with queries and
     could cause runtime type errors.

In that respect `*observer` directive works just like `*ngIf`. So if your components do require such functionality, you should switch to the manual mode of observing for your state.

##Have I use `angular_mobx` library if I want to leverage mobx state manegement in my AngularDart project?

By any means, no. All you have to do is to manually add `autorun` function to your component touching in it all relevant observables, and invoking 
`changeDetectionRef.markForCheck`, on dispose that reaction in `ngOnDestroy`. 
If you separate these actions in ancestor class, or mixin, all hassle will be minimized even further.
You can check how it could be done in `TodoItemComponent` of angular_todos example.
You can easily mix components that use *observer directive and manually managed components within single application.
So using the *observer directive is matter of personal choice and implementation constraints.


##Examples

We have three examples: angular_counter, todomvc and github_search examples are in `angular_mobx_examples` directory
