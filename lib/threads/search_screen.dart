import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2023/constants/gaps.dart';
import 'package:tiktok_clone_2023/constants/sizes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Sizes.size96,
        title: const Padding(
          padding: EdgeInsets.only(top: Sizes.size10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Search",
                    style: TextStyle(
                      fontSize: Sizes.size32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              CupertinoSearchTextField(),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Gaps.v10,
          member(
            name: 'bee',
            content: '졸업생, 웹기초 3기',
            follower: '106',
            profileColor: Colors.yellow.shade600,
          ),
          const Divider(height: 0, indent: Sizes.size80),
          member(
            name: 'Flynn🌱',
            content: '리액트 TA, 졸업생, 리액트 1기, 리액트 2기',
            follower: '6K',
            profileColor: Colors.blue,
          ),
          const Divider(height: 0, indent: Sizes.size80),
          member(
            name: 'Lynn',
            content: 'CREW',
            follower: '12M',
            profileColor: Colors.red,
          ),
          const Divider(height: 0, indent: Sizes.size80),
          member(
            name: 'MAX',
            content: 'CREW',
            follower: '3K',
            profileColor: Colors.red,
          ),
          const Divider(height: 0, indent: Sizes.size80),
          member(
            name: 'yoon',
            content: '졸업생, 리액트 1기',
            follower: '1.5K',
            profileColor: Colors.yellow.shade600,
          ),
          const Divider(height: 0, indent: Sizes.size80),
          member(
            name: '꾸잉허니',
            content: '졸업생, 웹기초 3기, 리액트 2기',
            follower: '1M',
            profileColor: Colors.yellow.shade600,
          ),
          const Divider(height: 0, indent: Sizes.size80),
          member(
            name: '담🐹',
            content: '졸업생, 리액트 1기, 리액트 2기',
            follower: '10K',
            profileColor: Colors.yellow.shade600,
          ),
          const Divider(height: 0, indent: Sizes.size80),
          member(
            name: '또자🌛',
            content: '졸업생, 리액트 2기',
            follower: '114K',
            profileColor: Colors.yellow.shade600,
          ),
        ],
      ),
    );
  }
}

class member extends StatefulWidget {
  member({
    super.key,
    required this.name,
    required this.content,
    required this.follower,
    required this.profileColor,
  });

  String name, content, follower;
  Color profileColor;

  @override
  State<member> createState() => _memberState();
}

class _memberState extends State<member> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        leading: Container(
          width: Sizes.size44,
          height: Sizes.size44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.profileColor,
          ),
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.user,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          widget.name,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: Sizes.size16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.content,
              style: const TextStyle(
                fontSize: Sizes.size14,
              ),
            ),
            Gaps.v7,
            Text(
              '${widget.follower} followers',
            ),
          ],
        ),
        trailing: Container(
          width: Sizes.size96,
          height: Sizes.size32,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: Sizes.size1,
            ),
            borderRadius: BorderRadius.circular(Sizes.size10),
          ),
          child: const Center(
            child: Text(
              "Follow",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        isThreeLine: true,
      ),
    );
  }
}
