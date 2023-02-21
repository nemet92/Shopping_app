// ignore: depend_on_referenced_packages
import 'package:mobx/mobx.dart';
import 'package:shoppinapp/core/service/general_service.dart';
import 'package:shoppinapp/core/service/model/login_model.dart';
part 'mobx_view_model.g.dart';

// ignore: library_private_types_in_public_api
class MobxStateManagement = _MobxStateManagementBase with _$MobxStateManagement;

abstract class _MobxStateManagementBase with Store {
  IService iService = GeneralService();

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @observable
  bool isVisible = false;

  @action
  changeVisibleValue() {
    isVisible = !isVisible;
  }

  @observable
  int currentIndex = 0;

  @action
  void changeIndex(int index) {
    currentIndex = index;
  }

  @action
  Future<void> signUpEmailAndPassword(UserLoginModel model) async {
    changeLoading();
    await iService.signUp(model);
    changeLoading();
  }
}
