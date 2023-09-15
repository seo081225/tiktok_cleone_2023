import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone_2023/constants/gaps.dart';
import 'package:tiktok_clone_2023/constants/sizes.dart';
import 'package:tiktok_clone_2023/threads/views/privacy_screen.dart';
import 'package:tiktok_clone_2023/threads/view_models/setting_view_model.dart';

class SettingsScreen extends StatefulWidget {
  static const routeURL = "setting";
  static const routeName = "setting";

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _onTap() {
    context.pushNamed(PrivacyScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.chevronLeft,
                size: Sizes.size18,
              ),
              Gaps.h8,
              Text(
                'Back',
                style: TextStyle(fontSize: Sizes.size18),
              ),
            ],
          ),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: Sizes.size20, fontWeight: FontWeight.w700),
        ),
        elevation: 0.1,
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: context.watch<SettingViewModel>().darkMode,
            onChanged: (value) =>
                context.read<SettingViewModel>().setDarkMode(value),
            title: const Text("Dark mode"),
          ),
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.userPlus,
              ),
            ),
            title: Text("Follow and invite friends"),
            titleAlignment: ListTileTitleAlignment.center,
          ),
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.bell,
              ),
            ),
            title: Text("Notifications"),
            titleAlignment: ListTileTitleAlignment.center,
          ),
          ListTile(
            onTap: _onTap,
            leading: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.lock,
              ),
            ),
            title: const Text("Privacy"),
            titleAlignment: ListTileTitleAlignment.center,
          ),
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.solidCircleUser,
              ),
            ),
            title: Text("Account"),
            titleAlignment: ListTileTitleAlignment.center,
          ),
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.lifeRing,
              ),
            ),
            title: Text("Help"),
            titleAlignment: ListTileTitleAlignment.center,
          ),
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.circleInfo,
              ),
            ),
            title: Text("About"),
            titleAlignment: ListTileTitleAlignment.center,
          ),
          const Divider(
            height: 10,
          ),
          CupertinoButton(
            onPressed: () => _showAlertDialog(context),
            alignment: Alignment.centerLeft,
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}

void _showAlertDialog(BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text("Log out"),
      content: const Text("Are you sure want to log out?"),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          /// This parameter indicates this action is the default,
          /// and turns the action's text to bold text.
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No'),
        ),
        CupertinoDialogAction(
          /// This parameter indicates the action would perform
          /// a destructive action such as deletion, and turns
          /// the action's text color to red.
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}
