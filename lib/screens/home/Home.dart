import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stupid_ios/screens/chat/Chat.dart';
import 'package:stupid_ios/screens/curriculum/Curriculum.dart';
import 'package:stupid_ios/screens/home/Dock.dart';
import 'package:stupid_ios/screens/home/models/folder.dart';
import 'package:stupid_ios/screens/vscode/VsCode.dart';
import 'package:stupid_ios/widgets/ImgButton.dart';
import 'package:stupid_ios/widgets/dialogs.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;
  int idx;
  @override
  void initState() {
    tabController = TabController(initialIndex: 1, length: 3, vsync: this);
    tabController.addListener(rebuild);
    super.initState();
  }

  @override
  void dispose() {
    tabController.removeListener(rebuild);
    tabController.dispose();
    super.dispose();
  }

  void rebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final kIconSize = (min(MediaQuery.of(context).size.width - 80, 450)) / 4;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'resource/image/bg.webp',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      GridView(
                          padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 6 / 10,
                            crossAxisCount: 4,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                          children: [
                            Column(
                              children: [
                                ImgButton(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) => Chat()));
                                  },
                                  child: Image.asset(
                                    'resource/image/messages.png',
                                    width: kIconSize,
                                    height: kIconSize,
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: FittedBox(
                                      child: Text(
                                        'Contact me',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                ImgButton(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) => VsCode()));
                                  },
                                  child: Image.asset(
                                    'resource/image/vscode.png',
                                    width: kIconSize,
                                    height: kIconSize,
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: FittedBox(
                                      child: Text(
                                        'VSCode',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                ImgButton(
                                  onTap: () {
                                    launch('https://github.com/mceck');
                                  },
                                  child: Image.asset(
                                    'resource/image/github.png',
                                    width: kIconSize,
                                    height: kIconSize,
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: FittedBox(
                                      child: Text(
                                        'GitHub',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                      GridView(
                        padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 6 / 10,
                          crossAxisCount: 4,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        children: [
                          ImgButton(
                            onTap: () {
                              showFolder(context, frontendFolder);
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  child: frontendFolder.icon,
                                  width: kIconSize,
                                  height: kIconSize,
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: FittedBox(
                                      child: Text(
                                        frontendFolder.name,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ImgButton(
                            onTap: () {
                              showFolder(context, backendFolder);
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  child: backendFolder.icon,
                                  width: kIconSize,
                                  height: kIconSize,
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: FittedBox(
                                      child: Text(
                                        backendFolder.name,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ImgButton(
                            onTap: () {
                              showFolder(context, otherSkillFolder);
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  child: otherSkillFolder.icon,
                                  width: kIconSize,
                                  height: kIconSize,
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: FittedBox(
                                      child: Text(
                                        otherSkillFolder.name,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ImgButton(
                            onTap: () {
                              showFolder(context, prizesFolder, false);
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  child: prizesFolder.icon,
                                  width: kIconSize,
                                  height: kIconSize,
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      prizesFolder.name,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GridView(
                        padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 6 / 10,
                          crossAxisCount: 4,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        children: [
                          Column(
                            children: [
                              ImgButton(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => Curriculum()));
                                },
                                child: Image.asset(
                                  'resource/image/safari.png',
                                  width: kIconSize,
                                  height: kIconSize,
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: FittedBox(
                                    child: Text(
                                      'Curriculum',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => TabPageSelectorIndicator(
                            key: ValueKey(index),
                            size: 8,
                            backgroundColor: index == tabController.index
                                ? Colors.white
                                : Colors.grey,
                            borderColor: Colors.transparent,
                          )),
                ),
                Dock(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
