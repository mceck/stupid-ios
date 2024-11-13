import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stupid_ios/screens/home/models/folder.dart';
import 'package:stupid_ios/widgets/ImgButton.dart';

Future<void> showFolder(BuildContext context, Folder f, [bool fitted = true]) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext ctx, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final kIconSize = (min(MediaQuery.of(context).size.width - 80, 450)) / 4;
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 50,
                  spreadRadius: 0,
                  offset: Offset(0, 20))
            ],
          ),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 4,
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            shrinkWrap: true,
            children: f.apps.map((app) {
              final child = SizedBox(
                width: kIconSize,
                child: ImgButton(
                  onTap: () {
                    if (app.link == null) {
                      return;
                    }
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => app.link!));
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        width: kIconSize,
                        height: kIconSize,
                        child: app.icon,
                      ),
                      Text(
                        app.name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
              if (!fitted) {
                return child;
              }
              return FittedBox(
                fit: BoxFit.scaleDown,
                child: child,
              );
            }).toList(),
          ),
        ),
      );
    },
    barrierDismissible: true,
    barrierLabel: 'folder',
    barrierColor: Colors.transparent,
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: (
      BuildContext ctx,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) =>
        BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: animation.value * 30,
        sigmaY: animation.value * 30,
      ),
      child: child,
    ),
  );
}
