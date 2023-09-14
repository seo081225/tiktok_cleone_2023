import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2023/constants/gaps.dart';
import 'package:tiktok_clone_2023/constants/sizes.dart';
import 'package:tiktok_clone_2023/twitter/password_screen.dart';
import 'package:tiktok_clone_2023/twitter/form_button.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  final String id;
  const ConfirmationCodeScreen({super.key, required this.id});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  final TextEditingController _text1Controller = TextEditingController();
  final TextEditingController _text2Controller = TextEditingController();
  final TextEditingController _text3Controller = TextEditingController();
  final TextEditingController _text4Controller = TextEditingController();

  String _text1 = "";
  String _text2 = "";
  String _text3 = "";
  String _text4 = "";

  @override
  void initState() {
    super.initState();

    setState(() {});

    _text1Controller.addListener(() {
      setState(() {
        _text1 = _text1Controller.text;
      });
    });

    _text2Controller.addListener(() {
      setState(() {
        _text2 = _text2Controller.text;
      });
    });

    _text3Controller.addListener(() {
      setState(() {
        _text3 = _text3Controller.text;
      });
    });

    _text4Controller.addListener(() {
      setState(() {
        _text4 = _text4Controller.text;
      });
    });
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _text1Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "We sent you a code",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v20,
              const Text(
                "Enter it below to verify",
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
              Text(widget.id),
              Gaps.v40,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    child: TextField(
                      controller: _text1Controller,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      onChanged: (_) => FocusScope.of(context).nextFocus(),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: Sizes.size28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Gaps.h20,
                  SizedBox(
                    width: 60,
                    child: TextField(
                      controller: _text2Controller,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      onChanged: (_) => FocusScope.of(context).nextFocus(),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: Sizes.size28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Gaps.h20,
                  SizedBox(
                    width: 60,
                    child: TextField(
                      controller: _text3Controller,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      onChanged: (_) => FocusScope.of(context).nextFocus(),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: Sizes.size28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Gaps.h20,
                  SizedBox(
                    width: 60,
                    child: TextField(
                      controller: _text4Controller,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: Sizes.size28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              Gaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size28,
                    color: _text1.isNotEmpty &&
                            _text2.isNotEmpty &&
                            _text3.isNotEmpty &&
                            _text4.isNotEmpty
                        ? Colors.green
                        : Colors.white,
                  ),
                ],
              ),
              Gaps.v60,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Didn't receive email?",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              Gaps.v12,
              GestureDetector(
                onTap: _onNextTap,
                child: FormButton(
                    disabled: _text1.isEmpty ||
                        _text2.isEmpty ||
                        _text3.isEmpty ||
                        _text4.isEmpty,
                    text: 'Next'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
