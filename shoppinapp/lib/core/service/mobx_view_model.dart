import 'package:mobx/mobx.dart';
part 'mobx_view_model.g.dart';

class LoginViewMode = __LoginViewModeBase with _$_LoginViewMode;

abstract class __LoginViewModeBase with Store {
  @observable
  bool isVisible = false;

  @action
  changeVisibleValue() {
    isVisible = !isVisible;
  }
}
