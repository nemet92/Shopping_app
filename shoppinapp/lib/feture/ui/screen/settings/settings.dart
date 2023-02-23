import 'package:flutter/material.dart';
import 'package:shoppinapp/core/extension/project_extension.dart';
import 'package:shoppinapp/feture/ui/global_widget/pop_menu.dart';
import 'package:shoppinapp/feture/ui/screen/settings/catagory/accaunt.dart';
import 'package:shoppinapp/product/AppText/app_string.dart';

import '../../global_widget/custom_cart.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:kartal/kartal.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                  context.navigateToPage(const Accaunt());
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
                trailing: PopMenuBar(
                  onSelected: () {},
                  items: [
                    PopUpMenuBarItem(
                      "lang.tr",
                      ImagePath.turkey.toImage,
                    ),
                    PopUpMenuBarItem("lang.en", ImagePath.unitedState.toImage)
                  ],
                  baseIscon: Icons.chevron_right,
                  iconColor: Colors.black,
                ),
                onPressed: () {},
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
