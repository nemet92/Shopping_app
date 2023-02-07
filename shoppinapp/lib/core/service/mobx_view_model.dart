import 'package:mobx/mobx.dart';
part 'mobx_view_model.g.dart';

class LoginViewMode = _LoginViewModeBase with _$LoginViewMode;

abstract class _LoginViewModeBase with Store {
  @observable
  bool isVisible = false;

  @action
  changeVisibleValue() {
    isVisible = !isVisible;
  }
}
