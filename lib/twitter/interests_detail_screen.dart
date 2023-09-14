import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2023/constants/gaps.dart';
import 'package:tiktok_clone_2023/constants/sizes.dart';
import 'package:tiktok_clone_2023/twitter/interest_button.dart';
import 'package:tiktok_clone_2023/twitter/form_button.dart';

const musicList = [
  "Rap",
  "R&B & Soul",
  "Grammy Awards",
  "Pop",
  "K-Pop",
  "Music industry",
  "EDM",
  "Music news",
  "Hip hop",
  "Reggae",
  "Dance",
];

const entertainmentList = [
  "Anime",
  "Movies & TV",
  "Harry Potter",
  "Marvel Universe",
  "Movie news",
  "Naruto",
  "Movies",
  "Grammy Awards",
  "Entertainment",
];

class InterestsDetailScreen extends StatefulWidget {
  const InterestsDetailScreen({super.key});

  @override
  State<InterestsDetailScreen> createState() => _InterestsDetailScreenState();
}

class _InterestsDetailScreenState extends State<InterestsDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();

  bool _checked = false;

  void _onNextTap() {
    //Navigator.push(
    // context,
    //    MaterialPageRoute(
//        builder: (context) => ,
    //      ),
    // )
  }
  void _onTap() {
    _checked = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {});
    });
    _scrollController.addListener(() {
      setState(() {});
    });
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
                  "Interests are used to personalize your experience and will be visible on your profile.",
                  style:
                      TextStyle(fontSize: Sizes.size16, color: Colors.black54),
                ),
                Gaps.v32,
                const Text(
                  "Music",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v12,
                SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 500,
                    child: Wrap(
                      runSpacing: 10,
                      spacing: 15,
                      children: [
                        for (var interest in musicList)
                          GestureDetector(
                              onTap: _onTap,
                              child: InterestButton(
                                interest: interest,
                                onSelectedChanged: "",
                              ))
                      ],
                    ),
                  ),
                ),
                Gaps.v32,
                const Text(
                  "Entertainment",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v12,
                SingleChildScrollView(
                  controller: _scrollController2,
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 500,
                    child: Wrap(
                      runSpacing: 10,
                      spacing: 15,
                      children: [
                        for (var interest in entertainmentList)
                          GestureDetector(
                              onTap: _onTap,
                              child: InterestButton(
                                interest: interest,
                                onSelectedChanged: "",
                              ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
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
              disabled: !_checked,
              text: "Next",
            ),
          ),
        ),
      ),
    );
  }
}
