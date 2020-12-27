import 'package:flutter/material.dart';

class Curriculum extends StatefulWidget {
  @override
  _CurriculumState createState() => _CurriculumState();
}

class _CurriculumState extends State<Curriculum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.blue),
        backgroundColor: Colors.grey[200],
        actionsIconTheme: IconThemeData(color: Colors.blue),
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                'resource/image/profile.jpg',
                width: 30,
                height: 30,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'About me',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        elevation: 1,
      ),
      body: Center(
        child: Text(
          'Curriculum TODO',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
