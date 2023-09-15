import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone_2023/constants/gaps.dart';
import 'package:tiktok_clone_2023/constants/sizes.dart';
import 'package:tiktok_clone_2023/threads/views/settings_screen.dart';
import 'package:tiktok_clone_2023/utils.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final List<Post> posts = [
    Post(
      type: PostType.text,
      content: 'This is a text post.',
      image: [],
    ),
    Post(
      type: PostType.image,
      content: 'help',
      image: ["assets/images/profile.jpg"],
    ),
    Post(
      type: PostType.image,
      content: 'hi',
      image: ["assets/images/heart_show.jpg", "assets/images/mac_show.jpg"],
    ),
  ];

  final List<Reply> replies = [
    Reply(
      nickname: 'show',
      content: 'flutter is hard for me😭',
      profile: "assets/images/mac_show.jpg",
      reply: 'OH, ME TOO',
    ),
    Reply(
      nickname: 'show',
      content: 'September 2 Guui Station 12:00',
      profile: "assets/images/mac_show.jpg",
      reply: '👩🏻‍💻👩🏻‍💻👩🏻‍💻👩🏻‍💻👩🏻‍💻🧑🏻‍💻',
    ),
    Reply(
      nickname: 'show',
      content: 'I want to go on a trip.',
      profile: "assets/images/heart_show.jpg",
      reply: 'I want to go home',
    ),
    Reply(
      nickname: 'show',
      content: 'I want to go home',
      profile: "assets/images/heart_show.jpg",
      reply: 'I want to go home',
    ),
    Reply(
      nickname: 'show',
      content: 'I want to go home',
      profile: "assets/images/heart_show.jpg",
      reply: 'I want to go home',
    ),
    Reply(
      nickname: 'show',
      content: 'I want to go home',
      profile: "assets/images/heart_show.jpg",
      reply: 'I want to go home',
    ),
    Reply(
      nickname: 'show',
      content: 'I want to go home',
      profile: "assets/images/heart_show.jpg",
      reply: 'I want to go home',
    ),
    Reply(
      nickname: 'show',
      content: 'I want to go home',
      profile: "assets/images/heart_show.jpg",
      reply: 'I want to go home',
    ),
    Reply(
      nickname: 'show',
      content: 'I want to go home',
      profile: "assets/images/heart_show.jpg",
      reply: 'I want to go home',
    ),
    Reply(
      nickname: 'show',
      content: 'I want to go home',
      profile: "assets/images/heart_show.jpg",
      reply: 'I want to go home',
    ),
  ];

  void _onGearPressed() {
    context.pushNamed(SettingsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: const Center(
                    child: FaIcon(
                  FontAwesomeIcons.globe,
                  size: Sizes.size28,
                )),
                actions: [
                  IconButton(
                    onPressed: _onGearPressed,
                    icon: const FaIcon(
                      FontAwesomeIcons.instagram,
                      size: Sizes.size28,
                    ),
                  ),
                  IconButton(
                    onPressed: _onGearPressed,
                    icon: const FaIcon(
                      FontAwesomeIcons.bars,
                      size: Sizes.size24,
                    ),
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Show",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: Sizes.size32,
                                ),
                              ),
                              Gaps.v8,
                              Row(
                                children: [
                                  const Text(
                                    "Show__1",
                                    style: TextStyle(
                                      fontSize: Sizes.size16,
                                    ),
                                  ),
                                  Gaps.h10,
                                  Container(
                                    padding: const EdgeInsets.all(Sizes.size8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          Sizes.size20,
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      "threads.net",
                                      style: TextStyle(
                                        fontSize: Sizes.size16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage("assets/images/profile.jpg"),
                          ),
                        ],
                      ),
                      Gaps.v8,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Hello, World!",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                            ),
                          )
                        ],
                      ),
                      Gaps.v10,
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundImage:
                                AssetImage("assets/images/profile.jpg"),
                          ),
                          CircleAvatar(
                            radius: 10,
                            backgroundImage:
                                AssetImage("assets/images/placeholder.jpg"),
                          ),
                          Gaps.h10,
                          Text(
                            "23 followers",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size10,
                              horizontal: Sizes.size52,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Sizes.size4),
                              ),
                            ),
                            child: const Text(
                              'Edit profile',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Gaps.h16,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size10,
                              horizontal: Sizes.size44,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Sizes.size4),
                              ),
                            ),
                            child: const Text(
                              'Share profile',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  if (post.type == PostType.text) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage("assets/images/profile.jpg"),
                              ),
                              Gaps.h10,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "show__1",
                                          style: TextStyle(
                                              fontSize: Sizes.size20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              Text('2m',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: Sizes.size16)),
                                              Gaps.h10,
                                              FaIcon(
                                                FontAwesomeIcons.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(post.content,
                                        style: const TextStyle(
                                            fontSize: Sizes.size20))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Gaps.v10,
                          const Padding(
                            padding: EdgeInsets.only(left: 65),
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
                          const Divider(
                            height: 30,
                          ),
                        ],
                      ),
                    );
                  } else if (post.type == PostType.image) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage("assets/images/profile.jpg"),
                              ),
                              Gaps.h10,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "show__1",
                                          style: TextStyle(
                                              fontSize: Sizes.size20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              Text('5m',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: Sizes.size16)),
                                              Gaps.h10,
                                              FaIcon(
                                                FontAwesomeIcons.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(post.content,
                                        style: const TextStyle(
                                            fontSize: Sizes.size20))
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
                                      borderRadius:
                                          BorderRadius.circular(Sizes.size8),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                (2 / 3),
                                        width: 330,
                                        child: Image.asset(
                                          img,
                                          fit: BoxFit.fill,
                                        ),
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
                          const Divider(
                            height: 30,
                          ),
                        ],
                      ),
                    );
                  }
                  return null;
                  //  return const SizedBox.shrink();
                },
              ),
              ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: replies.length,
                itemBuilder: (context, index) {
                  final reply = replies[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(reply.profile),
                            ),
                            Gaps.h10,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        reply.nickname,
                                        style: const TextStyle(
                                            fontSize: Sizes.size20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Row(
                                          children: [
                                            Text('5h',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: Sizes.size16)),
                                            Gaps.h10,
                                            FaIcon(
                                              FontAwesomeIcons.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(reply.content,
                                      style: const TextStyle(
                                          fontSize: Sizes.size20))
                                ],
                              ),
                            ),
                          ],
                        ),
                        Gaps.v10,
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Row(
                            children: [
                              Container(
                                color: Colors.grey,
                                height: Sizes.size32,
                                width: 2,
                              ),
                              Gaps.h32,
                              const FaIcon(FontAwesomeIcons.heart),
                              Gaps.h16,
                              const FaIcon(FontAwesomeIcons.message),
                              Gaps.h16,
                              const FaIcon(FontAwesomeIcons.arrowsRotate),
                              Gaps.h16,
                              const FaIcon(FontAwesomeIcons.paperPlane),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.grey,
                                height: Sizes.size20,
                                width: 2,
                              ),
                            ],
                          ),
                        ),
                        Gaps.v10,
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage("assets/images/profile.jpg"),
                            ),
                            Gaps.h10,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "show__1",
                                        style: TextStyle(
                                            fontSize: Sizes.size20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Row(
                                          children: [
                                            Text('2m',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: Sizes.size16)),
                                            Gaps.h10,
                                            FaIcon(
                                              FontAwesomeIcons.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    reply.reply,
                                    style:
                                        const TextStyle(fontSize: Sizes.size20),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 30,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: isDarkMode(context) ? Colors.white : Colors.black,
        labelPadding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        labelColor: isDarkMode(context) ? Colors.white : Colors.black,
        tabs: const [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Text("Threads"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Text("Replies"),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 39;

  @override
  double get minExtent => 39;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

enum PostType { text, image }

class Post {
  final PostType type;
  final String content;
  final List image;

  Post({
    required this.type,
    required this.content,
    required this.image,
  });
}

class Reply {
  final String nickname, content, profile, reply;

  Reply({
    required this.nickname,
    required this.content,
    required this.profile,
    required this.reply,
  });
}
