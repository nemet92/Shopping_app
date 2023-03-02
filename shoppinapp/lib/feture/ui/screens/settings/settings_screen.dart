import 'package:flutter/material.dart';
import 'package:shoppinapp/feture/ui/screens/settings/catagory/classes/language.dart';
import 'package:shoppinapp/feture/ui/screens/settings/catagory/user_inforamtion.dart';
import 'package:shoppinapp/product/AppText/app_string.dart';

import '../../global_widget/custom_cart.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:kartal/kartal.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    super.key,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late Function() onPressed;

  Icon? trailingIcon;

  Icon? leadingIcon;

  Text? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: const CustomNavigationBar2(),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Text(
              AppString.getString(
                AppStrings.setting,
              ),
            )),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            CustomCard(
                onPressed: () {
                  context.navigateToPage(const UserInforamtion());
                },
                leadingIcon: const Icon(Icons.person),
                title: Text(AppString.getString(AppStrings.profile))),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(FontAwesome.shopping_basket),
                title: Text(AppString.getString(AppStrings.orders))),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.payment),
                title: Text(AppString.getString(AppStrings.paymentMethods))),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.notifications),
                title: Text(AppString.getString(AppStrings.notifications))),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.manage_accounts),
                title: Text(AppString.getString(AppStrings.manageRefund))),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.read_more),
                title: Text(AppString.getString(AppStrings.referrals))),
            CustomCard(
                onPressed: () {},
                trailing: Container(
                  color: Colors.red,
                  child: DropdownButton(
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
                )

                //  PopMenuBar(
                //   onSelected: () {},
                //   items: [
                //     // PopUpMenuBarItem(
                //     //   "lang.tr",
                //     //   ImagePath.turkey.toImage,
                //     // ),
                //     // PopUpMenuBarItem("lang.en", ImagePath.unitedState.toImage)
                //   ],
                //   baseIscon: Icons.chevron_right,
                //   iconColor: Colors.black,
                // ),
                ,
                leadingIcon: const Icon(Icons.language),
                title: Text(AppString.getString(AppStrings.changeLanguage))),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.help_outline),
                title: Text(AppString.getString(AppStrings.helpSupport))),
          ],
        ));
  }
}

void _changeLanguage(Language language) {
  print(language.languageCode);
}
