import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2023/constants/gaps.dart';
import 'package:tiktok_clone_2023/constants/sizes.dart';
import 'package:tiktok_clone_2023/twitter/form_button.dart';
import 'package:tiktok_clone_2023/twitter/confirmation_code_screen.dart';
import 'package:tiktok_clone_2023/twitter/customize_experience_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({
    super.key,
  });

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  String buttonName = "Next";
  String _username = "";
  String _id = "";
  DateTime initialDate =
      DateTime.now().subtract(const Duration(days: 365 * 20));

  @override
  void initState() {
    super.initState();

    setState(() {});

    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });

    _idController.addListener(() {
      setState(() {
        _id = _idController.text;
      });
    });

    _birthdayController.addListener(() {
      showPicker(context);
    });
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
    _isBirthdayValid();
  }

  bool _isBirthdayValid() {
    return _birthdayController.value.toString().length > 4;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _idController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  bool _isLengthValid() {
    return _username.isNotEmpty &&
        _username.length > 1 &&
        _username.length <= 20;
  }

  bool _isValidEmailFormat() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_id);
  }

  bool _isValidPhoneNumberFormat() {
    return RegExp(r'^010[0-9]{4}[0-9]{4}$').hasMatch(_id);
  }

  bool get _isIdValid {
    return _isValidEmailFormat() || _isValidPhoneNumberFormat();
  }

  SizedBox showPicker(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CupertinoDatePicker(
        maximumDate: initialDate,
        initialDateTime: initialDate,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: _setTextFieldDate,
      ),
    );
  }

  void _onNextTap() async {
    if (_username.isEmpty) return;
    if (!_isIdValid) return;

    final returnData = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CustomizeExperienceScreen(),
      ),
    );
    buttonName = returnData;
    setState(() {});
  }

  void _onSignUpTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ConfirmationCodeScreen(id: _id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Stack(
          alignment: Alignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "Create your account",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v20,
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: "Name",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        child: FaIcon(
                          FontAwesomeIcons.circleCheck,
                          color: _isLengthValid() ? Colors.green : Colors.white,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h16,
                    ],
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v20,
              TextField(
                controller: _idController,
                decoration: InputDecoration(
                  hintText: "Phone number or email address",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        child: FaIcon(
                          FontAwesomeIcons.circleCheck,
                          color: _isIdValid ? Colors.green : Colors.white,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h16,
                    ],
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v20,
              GestureDetector(
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (BuildContext builder) {
                    return showPicker(context);
                  },
                ),
                child: TextField(
                  enabled: false,
                  controller: _birthdayController,
                  decoration: InputDecoration(
                    hintText: "Date of birth",
                    hintStyle: const TextStyle(color: Colors.black54),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          child: FaIcon(
                            FontAwesomeIcons.circleCheck,
                            color: _isBirthdayValid()
                                ? Colors.green
                                : Colors.white,
                            size: Sizes.size20,
                          ),
                        ),
                        Gaps.h16,
                      ],
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
              ),
              Gaps.v12,
              const Text(
                'This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black54,
                ),
              ),
              Gaps.v40,
              GestureDetector(
                onTap: buttonName == 'Sign up' ? _onSignUpTap : _onNextTap,
                child: FormButton(
                  disabled: _username.isEmpty || _id.isEmpty,
                  text: buttonName,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
