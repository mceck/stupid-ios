import 'package:flutter/material.dart';

class ImgButton extends StatelessWidget {
  final Widget child;
  final Function() onTap;

  const ImgButton({Key key, this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
