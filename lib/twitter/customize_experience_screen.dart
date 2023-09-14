import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2023/constants/gaps.dart';

import 'package:tiktok_clone_2023/constants/sizes.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({
    super.key,
  });

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool _isChecked = false;
  String retrunData = "Sign up";

  void _onNextTap() {
    Navigator.of(context).pop(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: FaIcon(
                FontAwesomeIcons.twitter,
                size: Sizes.size32,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(width: 36),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Gaps.v40,
            const Text(
              "Customize your experience",
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v40,
            const Text(
              "Track where you see Twitter content across the web",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v40,
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number. ",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                CupertinoSwitch(
                  value: _isChecked,
                  activeColor: CupertinoColors.activeGreen,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
              ],
            ),
            Gaps.v20,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'By signing up, you agree to our ',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
                Text(
                  'Terms',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const Text(
                  ',',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
            Gaps.v4,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Privace Policy',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const Text(
                  ', and ',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
                Text(
                  'Cookie Use',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const Text(
                  '. Twitter may use your',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
            const Expanded(
              child: Text(
                ' contact information, including your email address and phone number for purposes outlined in our Privacy Policy. Learn more',
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
            ),
            Gaps.h36,
            FractionallySizedBox(
              widthFactor: 1,
              child: AnimatedContainer(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.size36),
                  color: _isChecked
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                ),
                duration: const Duration(milliseconds: 500),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 500),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: Sizes.size16,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context, 'Sign up'),
                    child: const Text(
                      'Next',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
