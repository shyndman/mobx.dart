import 'package:mobx/mobx.dart';

part 'test_store.g.dart';

TestStore globalStore;

class TestStore = _TestStore with _$TestStore;

int fullNameCalculations = 0;
int firstCharCalculations = 0;

void clearGlobalCounters() {
  fullNameCalculations = 0;
  firstCharCalculations = 0;
}

abstract class _TestStore implements Store {
  @observable
  String firstName = "James";
  @observable
  String lastName = "Bond";
  @observable
  bool isAdult = false;

  @computed
  String get fullName {
    fullNameCalculations++;
    return '$firstName $lastName';
  }


  @action
  setNames(String firstName, String lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }

  @action
  toggleAdult() {
    isAdult = !isAdult;
  }
}
