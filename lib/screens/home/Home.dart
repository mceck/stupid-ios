import 'package:flutter/material.dart';
import 'package:stupid_ios/screens/home/Dock.dart';
import 'package:stupid_ios/screens/home/models/app-link.dart';
import 'package:stupid_ios/screens/home/models/folder.dart';
import 'package:stupid_ios/widgets/ImgButton.dart';
import 'package:stupid_ios/widgets/dialogs.dart';

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
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'resource/image/bg.jpeg',
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
                      Container(),
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
                                frontendFolder.icon,
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
                                backendFolder.icon,
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
                                otherSkillFolder.icon,
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
                        ],
                      ),
                      Container(),
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
