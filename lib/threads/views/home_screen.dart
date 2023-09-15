import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2023/constants/gaps.dart';
import 'package:tiktok_clone_2023/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  final List<Post> posts = [
    Post(
      type: PostType.text,
      nickname: "pubity",
      content: 'This is a text post.',
      image: [],
    ),
    Post(
      type: PostType.image,
      nickname: "thetinderblog",
      content: 'Hello',
      image: ['https://placedog.net/500'],
    ),
    Post(
      type: PostType.image,
      nickname: "tropicalseductions",
      content: 'See my pet',
      image: ['https://placedog.net/501'],
    ),
    Post(
      type: PostType.text,
      nickname: "terracottacoco",
      content: 'How do you do, fellow kids?',
      image: [],
    ),
    Post(
      type: PostType.text,
      nickname: "shityoushouldcareabout",
      content: 'my phone feels like a vibrator',
      image: [],
    ),
    Post(
      type: PostType.image,
      nickname: "thetinderblog",
      content: 'Hi',
      image: [
        'https://placedog.net/503',
        'https://placedog.net/510',
        'https://placedog.net/404'
      ],
    ),
    Post(
      type: PostType.image,
      nickname: "tropicalseductions",
      content: 'Show',
      image: ['https://placedog.net/505', 'https://placedog.net/400'],
    ),
  ];

  HomeScreen({super.key});

  void _onEllipsisTap(BuildContext context) async {
    final size = MediaQuery.of(context).size;
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: size.height * 0.35,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size14),
        ),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const FaIcon(FontAwesomeIcons.xmark),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.grey.shade200,
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Unfollow",
                            style: TextStyle(
                              fontSize: Sizes.size20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.grey.shade200,
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Mute",
                            style: TextStyle(
                              fontSize: Sizes.size20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gaps.v20,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.grey.shade200,
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Hide",
                            style: TextStyle(
                              fontSize: Sizes.size20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _onReportTap(context),
                        child: Container(
                          color: Colors.grey.shade200,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Report",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: Sizes.size20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onReportTap(BuildContext context) async {
    final size = MediaQuery.of(context).size;
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: size.height * 0.5,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size14),
        ),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "Report",
              style: TextStyle(
                  fontSize: Sizes.size20, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const FaIcon(FontAwesomeIcons.xmark),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Why are you reporting this thread?",
                  style: TextStyle(
                      fontSize: Sizes.size20, fontWeight: FontWeight.bold),
                ),
                Gaps.v10,
                Text(
                  "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.grey.shade400,
                  ),
                ),
                Gaps.v20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "I just don't like it",
                      style: TextStyle(fontSize: Sizes.size20),
                    ),
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: Colors.grey.shade500,
                      size: Sizes.size16,
                    )
                  ],
                ),
                Gaps.v20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "It's unlawful content under NetzDG",
                      style: TextStyle(fontSize: Sizes.size20),
                    ),
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: Colors.grey.shade500,
                      size: Sizes.size16,
                    )
                  ],
                ),
                Gaps.v20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "It's spam",
                      style: TextStyle(fontSize: Sizes.size20),
                    ),
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: Colors.grey.shade500,
                      size: Sizes.size16,
                    )
                  ],
                ),
                Gaps.v20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Hate speech or symbols",
                      style: TextStyle(fontSize: Sizes.size20),
                    ),
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: Colors.grey.shade500,
                      size: Sizes.size16,
                    )
                  ],
                ),
                Gaps.v20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Nudity or sexual activity",
                      style: TextStyle(fontSize: Sizes.size20),
                    ),
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: Colors.grey.shade500,
                      size: Sizes.size16,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(top: Sizes.size20),
          child: FaIcon(
            FontAwesomeIcons.at,
            size: Sizes.size40,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          if (post.type == PostType.text) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        child: Text(post.nickname.substring(0, 1),
                            style: const TextStyle(
                                height: 1,
                                fontSize: Sizes.size32,
                                fontWeight: FontWeight.w600)),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  post.nickname,
                                  style: const TextStyle(
                                      fontSize: Sizes.size20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      const Text('2m',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: Sizes.size16)),
                                      Gaps.h10,
                                      GestureDetector(
                                        onTap: () => _onEllipsisTap(context),
                                        child: const FaIcon(
                                          FontAwesomeIcons.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(post.content,
                                style: const TextStyle(fontSize: Sizes.size20))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gaps.v10,
                  const Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Row(
                      children: [
                        FaIcon(FontAwesomeIcons.heart),
                        Gaps.h16,
                        FaIcon(FontAwesomeIcons.message),
                        Gaps.h16,
                        FaIcon(FontAwesomeIcons.arrowsRotate),
                        Gaps.h16,
                        FaIcon(FontAwesomeIcons.paperPlane),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (post.type == PostType.image) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.amber.shade400,
                        foregroundColor: Colors.black,
                        radius: 25,
                        child: Text(post.nickname.substring(0, 1),
                            style: const TextStyle(
                                height: 1,
                                fontSize: Sizes.size32,
                                fontWeight: FontWeight.w600)),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  post.nickname,
                                  style: const TextStyle(
                                      fontSize: Sizes.size20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      const Text('5m',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: Sizes.size16)),
                                      Gaps.h10,
                                      GestureDetector(
                                        onTap: () => _onEllipsisTap(context),
                                        child: const FaIcon(
                                          FontAwesomeIcons.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(post.content,
                                style: const TextStyle(fontSize: Sizes.size20))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gaps.v5,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Gaps.h60,
                        for (var img in post.image)
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(Sizes.size8),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * (2 / 3),
                                width: 330,
                                child: Image.network(img, fit: BoxFit.cover),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Gaps.v10,
                  const Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Row(
                      children: [
                        FaIcon(FontAwesomeIcons.heart),
                        Gaps.h16,
                        FaIcon(FontAwesomeIcons.message),
                        Gaps.h16,
                        FaIcon(FontAwesomeIcons.arrowsRotate),
                        Gaps.h16,
                        FaIcon(FontAwesomeIcons.paperPlane),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return null;
          //  return const SizedBox.shrink();
        },
      ),
    );
  }
}

enum PostType { text, image }

class Post {
  final PostType type;
  final String nickname, content;
  final List image;

  Post({
    required this.type,
    required this.nickname,
    required this.content,
    required this.image,
  });
}
