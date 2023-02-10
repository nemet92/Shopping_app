import 'package:mobx/mobx.dart';
import 'package:shoppinapp/core/service/general_service.dart';
part 'mobx_view_model.g.dart';

class LoginViewMode = _LoginViewModeBase with _$LoginViewMode;

abstract class _LoginViewModeBase with Store {
  late IService iService;
  _LoginViewModeBase() {
    iService = GeneralService();
  }

  // @observable
  // List<UserLoginModel>? items;
  // @action
  // Future <void> postLogin(UserLoginModel model) async {
  //   items = await iService.postLogin(model);
  //   return items;
  // }

  @observable
  bool isVisible = false;

  @action
  changeVisibleValue() {
    isVisible = !isVisible;
  }
}

// import 'package:mobx/mobx.dart';
// import 'package:shoppinapp/core/service/General_service.dart';
// import 'package:shoppinapp/model/login_model.dart';
// part 'mobx_view_model.g.dart';

// class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

// abstract class _LoginViewModelBase with Store {
//   late IService iService;
//   _LoginViewModelBase() {
//     iService = GeneralService();
//   }

//   @observable
//   int? statusCode;

//   @action
//   Future postLogin(UserLoginModel model) async {
//     final response = await iService.postLogin(model);
//     statusCode = response.statusCode;
//     print("ne$statusCode");
//   }

//   @observable
//   bool isVisible = false;

//   @action
//   changeVisibleValue() {
//     isVisible = !isVisible;
//   }
// }
