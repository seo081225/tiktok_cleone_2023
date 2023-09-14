import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2023/constants/gaps.dart';
import 'package:tiktok_clone_2023/constants/sizes.dart';
import 'package:tiktok_clone_2023/utils.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late ScrollController scrollcontroller;
  late TextEditingController _textEditingController;

  @override
  void dispose() {
    scrollcontroller.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    scrollcontroller = ScrollController();
    _textEditingController = TextEditingController();
    super.initState();
  }

  void _onNextTap() {
    // Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(
    //     builder: (context) => const VideoRecordingScreen(),
    //   ),
    //   (route) => false,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Container(),
        flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 88),
            child: Container(
                decoration: BoxDecoration(
                    color: isDarkMode(context)
                        ? Colors.grey.shade900
                        : Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 15, top: 5),
                            child: GestureDetector(
                                onTap: () => {},
                                child: const Text("Cancel",
                                    style: TextStyle(
                                        fontSize: Sizes.size16,
                                        fontWeight: FontWeight.w400)))),
                        Container(
                          width: 65,
                        ),
                        const Text(
                          "   New threads",
                          style: TextStyle(
                              fontSize: Sizes.size20,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                      //)
                    ),
                  ],
                ))),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: isDarkMode(context) ? Colors.grey.shade900 : Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          backgroundImage:
                              AssetImage("assets/images/profile.jpg"),
                        ),
                        Container(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: 2,
                          color: const Color.fromARGB(255, 124, 124, 124),
                        ),
                        Container(
                          height: 10,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 124, 124, 124),
                              shape: BoxShape.circle),
                        )
                      ],
                    ),
                    Container(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gaps.v10,
                        const Text(
                          'Seo',
                          style: TextStyle(
                              fontSize: Sizes.size20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 100,
                          height: MediaQuery.of(context).size.height / 3,
                          child: Column(
                            children: [
                              TextField(
                                maxLength: 500,
                                style: TextStyle(
                                  color: isDarkMode(context)
                                      ? Colors.grey.shade400
                                      : Colors.grey.shade900,
                                ),
                                controller: _textEditingController,
                                onChanged: (texts) {
                                  setState(() {});
                                },
                                maxLines: null,
                                decoration: const InputDecoration(
                                    suffix: SizedBox(
                                      height: 70,
                                      width: 50,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "Post",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Start a threads..",
                                    hintStyle: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 112, 112, 112),
                                        overflow: TextOverflow.ellipsis)),
                              ),
                              Gaps.h16,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: _onNextTap,
                                    child: FaIcon(
                                      FontAwesomeIcons.paperclip,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 1,
                  height: MediaQuery.of(context).size.height / 5,
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: const SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
