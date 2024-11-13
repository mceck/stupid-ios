import 'package:flutter/material.dart';

class FakeDialer extends StatefulWidget {
  @override
  _FakeDialerState createState() => _FakeDialerState();
}

class _FakeDialerState extends State<FakeDialer> {
  String number = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BackButton(color: Colors.blue),
                Expanded(
                  child: Text(
                    number,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 42, color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      number = number.substring(0, number.length - 1);
                    });
                  },
                  icon: Icon(Icons.backspace),
                  color: Colors.blue[800],
                  iconSize: 28,
                ),
              ],
            ),
            SizedBox(height: 40),
            Expanded(
              child: FittedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Number(
                          number: 1,
                          letters: '',
                          onTap: () => setState(() {
                            number += '1';
                          }),
                        ),
                        Number(
                          number: 2,
                          letters: 'ABC',
                          onTap: () => setState(() {
                            number += '2';
                          }),
                        ),
                        Number(
                          number: 3,
                          letters: 'DEF',
                          onTap: () => setState(() {
                            number += '3';
                          }),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Number(
                          number: 4,
                          letters: 'GHI',
                          onTap: () => setState(() {
                            number += '4';
                          }),
                        ),
                        Number(
                          number: 5,
                          letters: 'JKL',
                          onTap: () => setState(() {
                            number += '5';
                          }),
                        ),
                        Number(
                          number: 6,
                          letters: 'MNO',
                          onTap: () => setState(() {
                            number += '6';
                          }),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Number(
                          number: 7,
                          letters: 'PQRS',
                          onTap: () => setState(() {
                            number += '7';
                          }),
                        ),
                        Number(
                          number: 8,
                          letters: 'TUV',
                          onTap: () => setState(() {
                            number += '8';
                          }),
                        ),
                        Number(
                          number: 9,
                          letters: 'WXYZ',
                          onTap: () => setState(() {
                            number += '9';
                          }),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Number(
                          number: '*',
                          letters: '',
                          onTap: () => setState(() {
                            number += '*';
                          }),
                        ),
                        Number(
                          number: 0,
                          letters: '+',
                          onTap: () => setState(() {
                            number += '0';
                          }),
                        ),
                        Number(
                          number: '#',
                          letters: '',
                          onTap: () => setState(() {
                            number += '#';
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Service unavailable'),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            backgroundColor: Colors.green[400],
                            shape: CircleBorder(),
                          ),
                          child: Icon(
                            Icons.call,
                            color: Colors.white,
                            size: 62,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Number extends StatelessWidget {
  final dynamic number;
  final String letters;
  final Function() onTap;

  const Number(
      {Key? key, this.number, required this.letters, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      width: (MediaQuery.of(context).size.width - 60) / 3,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(18),
          backgroundColor: Colors.grey[300],
          shape: CircleBorder(),
        ),
        child: Column(
          children: [
            Text(
              number.toString(),
              style: TextStyle(fontSize: 48),
            ),
            Text(letters),
          ],
        ),
      ),
    );
  }
}
