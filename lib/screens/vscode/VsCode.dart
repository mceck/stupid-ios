import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs.dart';

const String test = '''
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/vs.dart';

class VsCode extends StatefulWidget {
  @override
  _VsCodeState createState() => _VsCodeState();
}

class _VsCodeState extends State<VsCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HighlightView(
      // The original code to be highlighted
      'hello',

      // Specify language
      // It is recommended to give it a value for performance
      language: 'dart',

      // Specify highlight theme
      // All available themes are listed in `themes` folder
      theme: vsTheme,

      // Specify padding
      padding: EdgeInsets.all(12),

      // Specify text style
      textStyle: TextStyle(
        fontFamily: 'My awesome monospace font',
        fontSize: 16,
      ),
    ),
      
    );
  }
}''';

class VsCode extends StatefulWidget {
  @override
  _VsCodeState createState() => _VsCodeState();
}

class _VsCodeState extends State<VsCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HighlightView(
        // The original code to be highlighted
        test,

        // Specify language
        // It is recommended to give it a value for performance
        language: 'dart',

        // Specify highlight theme
        // All available themes are listed in `themes` folder
        theme: vsTheme,

        // Specify padding
        padding: EdgeInsets.all(12),

        // Specify text style
        textStyle: TextStyle(
          fontFamily: 'My awesome monospace font',
          fontSize: 16,
        ),
      ),
    );
  }
}
