import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppinapp/feture/ui/global_widget/custom_navigationBar.dart';

import '../../../../../core/mobx/mobx_view_model.dart';
import '../../../../../core/service/model/login_model.dart';
import '../../../../../product/AppText/app_string.dart';
import '../../../../../product/AppTextStyle/app_text_style.dart';
import '../../../global_widget/custom_elevatedButton.dart';
import '../../../global_widget/custom_textFormFiled.dart';

class UserInforamtion extends StatefulWidget {
  const UserInforamtion({super.key});

  @override
  State<UserInforamtion> createState() => _UserInforamtionState();
}

class _UserInforamtionState extends State<UserInforamtion> {
  TextEditingController registerNameController = TextEditingController();

  TextEditingController registerPassNameController = TextEditingController();

  TextEditingController registerAdressController = TextEditingController();

  MobxStateManagement mobxStateManagement = MobxStateManagement();

  final bool _validateUserName = false;
  final bool _validateUserPassword = false;
  final bool _validateRegister = false;

  File? imageFile;
  String? imagePath;

  void takePhoto(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? picedFile = await picker.pickImage(source: source);
    if (picedFile != null) {
      //save image
      writeData(picedFile.path.toString());
      setState(() {
        imageFile = File(picedFile.path);
      });
    }
  }

  Future<void> writeData(String value) async {
    final sharedPref = await SharedPreferences.getInstance();

    sharedPref.setString("path", value);
    readData();
  }

  Future<void> readData() async {
    final sharedPref = await SharedPreferences.getInstance();
    setState(() {
      imagePath = sharedPref.getString(
        "path",
      );
    });
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  context.navigateToReset("login");
                },
                icon: const Icon(Icons.exit_to_app))
          ],
          leading: IconButton(
              onPressed: () {
                context.navigateToPage(const GlobalNavigationBar());
              },
              icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
          title: const Text("Profile"),
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: imageProfile(),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  _registerDialog(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  height: 50,
                  width: 200,
                  color: Colors.black45,
                  child: const Center(child: Text("Gmail daxil aktiv et!")),
                ),
              )
            ],
          ),
        ));
  }

  Future<dynamic> _registerDialog(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            scrollable: true,
            insetPadding: const EdgeInsets.symmetric(horizontal: 12),
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.getString(AppStrings.alertTitle),
                  style: AppStyles.getStyle(AppTextStyles.alertTitle),
                ),
                IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
            content: Text(
              AppString.getString(AppStrings.alertcontent),
              style: AppStyles.getStyle(AppTextStyles.alertContent),
            ),
            actions: [
              CustomTextFormFiled(
                usernameController: registerNameController,
                validator: _validateUserName,
                errorText: "Format Duzgun deyil",
                hintText: AppString.getString(AppStrings.nameHint),
              ),
              sizedBox(10.h),
              CustomTextFormFiled(
                  usernameController: registerPassNameController,
                  validator: _validateUserPassword,
                  errorText: "Format Duzgun deyil",
                  hintText: AppString.getString(AppStrings.passwordHint)),
              sizedBox(10.h),
              CustomElevatedButton(
                  text:
                      Text(AppString.getString(AppStrings.registerButtonText)),
                  color: Colors.red,
                  sideColor: Colors.red,
                  onPressed: () async {
                    if (registerNameController.text.isNotEmpty &&
                        registerPassNameController.text.isNotEmpty) {
                      final model = UserLoginModel(
                          email: registerNameController.text,
                          password: registerPassNameController.text);
                      mobxStateManagement.signUpEmailAndPassword(model);
                      context.navigateToPage(const GlobalNavigationBar());
                    }
                  })
            ],
          );
        });
  }

  SizedBox sizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        children: [
          const Text(
            "bottomSheetText",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                child: const Icon(Icons.camera),
              ),
              FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                child: const Icon(Icons.image),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          imagePath == null
              ? CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.20,
                  child: SizedBox(
                    child: ClipOval(
                      child: Image.asset(
                        "assets/Image_not_available.png",
                      ),
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.20,
                  backgroundImage:
                      FileImage(scale: 0.4, imageFile ?? File((imagePath!))),
                ),
          Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: ((builder) => bottomSheet()));
              },
              child: Icon(
                Icons.camera,
                color: Colors.red,
                size: 32.r,
              ),
            ),
          )
        ],
      ),
    );
  }
}
