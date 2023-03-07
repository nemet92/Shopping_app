// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shoppinapp/feture/ui/screens/settings/catagory/user_inforamtion.dart';
import 'package:shoppinapp/main.dart';
import 'package:shoppinapp/classes/language/localization_constants.dart';

import '../../global_widget/custom_cart.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:kartal/kartal.dart';

import '../../../../classes/language.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    super.key,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void _changeLanguage(Language language) async {
    Locale temp = await setLocale(language.languageCode);
    MyApp.setLocale(context, temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Text(getTranslated(context, "setting"))),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            CustomCard(
                onPressed: () {
                  context.navigateToPage(const UserInforamtion());
                },
                leadingIcon: const Icon(Icons.person),
                title: Text(getTranslated(context, "profil"))),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(FontAwesome.shopping_basket),
                title: Text(getTranslated(context, "orders"))),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.payment),
                title: Text(getTranslated(context, "paymentMethods"))),
            CustomCard(
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                ),
                onPressed: () {},
                leadingIcon: const Icon(Icons.notifications),
                title: Text(getTranslated(context, "notifications"))),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.manage_accounts),
                title: Text(getTranslated(context, "manageRefund"))),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.read_more),
                title: Text(getTranslated(context, "referrals"))),
            Card(
              child: ListTile(
                minLeadingWidth: 1,
                style: ListTileStyle.drawer,
                leading: const Icon(
                  Icons.language,
                  color: Colors.red,
                ),
                title: Text(getTranslated(context, "changeLanguage")),
                trailing: DropdownButton(
                  icon: const Visibility(
                      visible: true,
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.black,
                        // size: 24,
                      )),
                  onChanged: (language) {
                    _changeLanguage(language!);
                  },
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                        (lang) => DropdownMenuItem(
                          value: lang,
                          child: Row(
                            children: [Text(lang.flag), Text(lang.name)],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            )

            // CustomCard(
            //     onPressed: () {},
            //     trailing: DropdownButton(
            //       borderRadius: const BorderRadius.all(Radius.circular(0)),
            //       elevation: 0,
            //       icon: const Visibility(
            //           visible: true,
            //           child: Icon(
            //             Icons.arrow_right,
            //             color: Colors.black,
            //             size: 24,
            //           )),
            //       onChanged: (language) {
            //         _changeLanguage(language!);
            //       },
            //       items: Language.languageList()
            //           .map<DropdownMenuItem<Language>>(
            //             (lang) => DropdownMenuItem(
            //               value: lang,
            //               child: Row(
            //                 children: [Text(lang.flag), Text(lang.name)],
            //               ),
            //             ),
            //           )
            //           .toList(),
            //     ),

            //     //     //     PopMenuBar(
            //     //     //   onSelected: () {},
            //     //     //   items: [
            //     //     //     PopUpMenuBarItem(
            //     //     //       "lang.tr",
            //     //     //       ImagePath.turkey.toImage,
            //     //     //     ),
            //     //     //     PopUpMenuBarItem("lang.en", ImagePath.unitedState.toImage)
            //     //     //   ],
            //     //     //   baseIscon: Icons.chevron_right,
            //     //     //   iconColor: Colors.black,
            //     //     // ),
            //     leadingIcon: const Icon(Icons.language),
            //     title: Text(AppString.getString(AppStrings.changeLanguage))),

            ,
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.help_outline),
                title: Text(getTranslated(context, "helpSupport"))),
          ],
        ));
  }
}
