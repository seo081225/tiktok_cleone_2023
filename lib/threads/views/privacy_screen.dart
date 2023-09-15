import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2023/constants/gaps.dart';
import 'package:tiktok_clone_2023/constants/sizes.dart';

class PrivacyScreen extends StatefulWidget {
  static const routeURL = "privacy";
  static const routeName = "privacy";

  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _notifications = true;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
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
          'Privacy',
          style: TextStyle(fontSize: Sizes.size20, fontWeight: FontWeight.w700),
        ),
        elevation: 0.1,
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: const Text("Private profile"),
            secondary: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.lock,
              ),
            ),
          ),
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.at,
              ),
            ),
            title: Text("Mentions"),
            titleAlignment: ListTileTitleAlignment.center,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Everyone",
                ),
                Gaps.h10,
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.bellSlash,
              ),
            ),
            title: Text("Muted"),
            titleAlignment: ListTileTitleAlignment.center,
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
            ),
          ),
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.eyeSlash,
              ),
            ),
            title: Text("Hidden Words"),
            titleAlignment: ListTileTitleAlignment.center,
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
            ),
          ),
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.userGroup,
              ),
            ),
            title: Text("Profiles you follow"),
            titleAlignment: ListTileTitleAlignment.center,
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
            ),
          ),
          const Divider(
            height: 10,
          ),
          const ListTile(
            title: Text("Other privacy settings"),
            subtitle: Text(
              "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
            ),
            titleAlignment: ListTileTitleAlignment.center,
            isThreeLine: true,
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
            ),
          ),
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.circleXmark,
              ),
            ),
            title: Text("Blocked profiles"),
            titleAlignment: ListTileTitleAlignment.center,
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
            ),
          ),
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.heartCircleXmark,
              ),
            ),
            title: Text("Hide likes"),
            titleAlignment: ListTileTitleAlignment.center,
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
            ),
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
