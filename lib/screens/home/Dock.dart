import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stupid_ios/screens/chat/Chat.dart';
import 'package:stupid_ios/screens/dialer/FakeDialer.dart';
import 'package:stupid_ios/widgets/ImgButton.dart';

class Dock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kIconSize = (min(MediaQuery.of(context).size.width - 80, 450)) / 4;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(14),
      constraints: BoxConstraints(maxWidth: 500),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 40,
            sigmaY: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImgButton(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => FakeDialer()));
                },
                child: Image.asset(
                  'resource/image/phone.png',
                  width: kIconSize,
                  height: kIconSize,
                ),
              ),
              ImgButton(
                onTap: () {},
                child: Image.asset(
                  'resource/image/safari.png',
                  width: kIconSize,
                  height: kIconSize,
                ),
              ),
              ImgButton(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => Chat()));
                },
                child: Image.asset(
                  'resource/image/messages.png',
                  width: kIconSize,
                  height: kIconSize,
                ),
              ),
              ImgButton(
                onTap: () {},
                child: Image.asset(
                  'resource/image/vscode.png',
                  width: kIconSize,
                  height: kIconSize,
                ),
              ),
            ],
          )),
    );
  }
}
