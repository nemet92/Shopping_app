import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({
    super.key,
  });
  late Function() onPressed;
  Icon? trailingIcon;
  Icon? leadingIcon;
  Text? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Setting",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.person),
                title: const Text("Profil")),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.person),
                title: const Text("Orders")),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.payment),
                title: const Text("Profil")),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.notifications),
                title: const Text("Notifications")),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.manage_accounts),
                title: const Text("Profil")),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.read_more),
                title: const Text("Profil")),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.language),
                title: const Text("Change Language")),
            CustomCard(
                onPressed: () {},
                leadingIcon: const Icon(Icons.help_outline),
                title: const Text("Help & Support")),
          ],
        ));
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.onPressed,
    required this.leadingIcon,
    required this.title,
  });

  final Function() onPressed;
  final Icon? leadingIcon;
  final Text? title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        iconColor: Colors.red,
        onTap: onPressed,
        minLeadingWidth: 1,
        trailing: const Icon(
          Icons.arrow_circle_right,
          color: Colors.black54,
        ),
        leading: leadingIcon,
        title: title,
      ),
    );
  }
}

Function? onPressed;
