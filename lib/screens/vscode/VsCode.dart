import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:http/http.dart' as http;

import 'VsDrawer.dart';

class VsCode extends StatefulWidget {
  @override
  _VsCodeState createState() => _VsCodeState();
}

class _VsCodeState extends State<VsCode> {
  String code = 'Open a file...';

  Future<void> loadCode(String url) async {
    final resp = await http.get(Uri.parse(url));
    setState(() {
      code = resp.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.blue),
        backgroundColor: Colors.grey[200],
        actionsIconTheme: IconThemeData(color: Colors.blue),
        title: Row(
          children: [
            Image.asset(
              'resource/image/vscode.png',
              width: 24,
              height: 24,
            ),
            SizedBox(width: 10),
            Text(
              'VSCode',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        elevation: 1,
      ),
      endDrawer: VsDrawer(loadCode: loadCode),
      backgroundColor: Color(0xff282c34),
      body: SingleChildScrollView(
        child: HighlightView(
          // The original code to be highlighted
          code,

          // Specify language
          // It is recommended to give it a value for performance
          language: 'javascript',

          // Specify highlight theme
          // All available themes are listed in `themes` folder
          theme: atomOneDarkTheme,

          // Specify padding
          padding: EdgeInsets.all(12),

          // Specify text style
          textStyle: TextStyle(
            fontFamily: 'SFMono',
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
