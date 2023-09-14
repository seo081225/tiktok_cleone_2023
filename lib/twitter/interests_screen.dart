import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2023/constants/gaps.dart';
import 'package:tiktok_clone_2023/constants/sizes.dart';
import 'package:tiktok_clone_2023/twitter/interest_button.dart';
import 'package:tiktok_clone_2023/twitter/form_button.dart';
import 'package:tiktok_clone_2023/twitter/interests_detail_screen.dart';

const interests = [
  "Fashion & beauty",
  "Outdoors",
  "Art & cluture",
  "Animation & comics",
  "Business & finance",
  "Food",
  "Travel",
  "Entertainment",
  "Music",
  "Gaming",
  "Fashion & beauty",
  "Outdoors",
  "Art & cluture",
  "Animation & comics",
  "Business & finance",
  "Food",
  "Travel",
  "Entertainment",
  "Music",
  "Gaming",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();

  int selectedCount = 0;

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InterestsDetailScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size24,
              right: Sizes.size24,
              bottom: Sizes.size16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v32,
                const Text(
                  "What do you want to see on Twitter?",
                  style: TextStyle(
                    fontSize: Sizes.size32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v20,
                const Text(
                  "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                  style:
                      TextStyle(fontSize: Sizes.size16, color: Colors.black54),
                ),
                Gaps.v48,
                Wrap(
                  runSpacing: 15,
                  spacing: 15,
                  children: [
                    for (var interest in interests)
                      GestureDetector(
                          //onTap: () => _onTap(interest),
                          child: InterestButton(
                        interest: interest,
                        onSelectedChanged: (isSelected) {
                          setState(() {
                            isSelected ? selectedCount++ : selectedCount--;
                          });
                        },
                      ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: Sizes.size40,
            top: Sizes.size16,
            left: Sizes.size24,
            right: Sizes.size24,
          ),
          child: GestureDetector(
            onTap: _onNextTap,
            child: FormButton(
              disabled: selectedCount != 3,
              text: "Next",
            ),
          ),
        ),
      ),
    );
  }
}
