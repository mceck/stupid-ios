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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ABOUT ME',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'I\'m an addicted to software developing and new technologies',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 15),
            Text(
              'PROFESSIONAL EXPERIENCE',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              '2020 - today - Permanent employee as fullstack deveoper in a consulting and software development company in Florence, collaborating with important companies private companies such as supermarkets and pharmaceutical companies for the development of mainly web and mobile applications',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 15),
            Text(
              '2014-2020 - Permanent employee as a programmer at a company management software informatics in Florence, collaborating with private companies and public administrations for the development of desktop and web applications',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 15),
            Text(
              '2008 Internship at an IT company near Florence',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 15),
            Text(
              'ENDUCATION AND TRAINING',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'University of Pisa - Computer Engineering',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'University career currently suspended with 6 exams missing from graduation',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 15),
            Text(
              'High school',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Diploma obtained in 2009 at the Russel-Newton scientific high school in Scandicci (Florence)',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
