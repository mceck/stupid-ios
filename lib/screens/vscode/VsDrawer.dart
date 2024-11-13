import 'package:flutter/material.dart';
import 'package:stupid_ios/screens/vscode/repo.dart';

class VsDrawer extends StatelessWidget {
  final Function(String) loadCode;

  const VsDrawer({
    Key? key,
    required this.loadCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      child: Container(
        color: Color(0xff20242a),
        child: ListView(
          children: buildFolder(context, STATIC_REPO['children']),
        ),
      ),
    );
  }

  List<Widget> buildFolder(
      BuildContext context, List<Map<String, dynamic>> children,
      {double padLeft = 0.0}) {
    return children.map((node) {
      if (node['type'] == 'tree')
        return Padding(
          padding: EdgeInsets.only(left: padLeft),
          child: ExpansionTile(
            title: Text(
              node['path'],
              style: const TextStyle(color: Colors.white),
            ),
            leading: Image.asset(
              'resource/image/folderico.png',
              width: 16,
            ),
            children:
                buildFolder(context, node['children'], padLeft: padLeft + 10),
          ),
        );
      return Padding(
        padding: EdgeInsets.only(left: padLeft),
        child: InkWell(
          onTap: () {
            loadCode(node['url']);
            Navigator.of(context).pop();
          },
          child: ListTile(
            leading: Image.asset(
              icoFromExt(node['path']),
              width: 16,
            ),
            title: Text(
              node['path'],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    }).toList();
  }

  String icoFromExt(String f) {
    if (RegExp('.tsx?\$').hasMatch(f)) return 'resource/image/tsico.png';
    if (RegExp('.jsx?\$').hasMatch(f)) return 'resource/image/jsico.png';
    return 'resource/image/defaultico.png';
  }
}
