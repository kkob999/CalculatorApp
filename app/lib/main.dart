// ignore_for_file: prefer_const_constructors

import 'package:app/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var ques = '';
  var ans = '';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '='
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 26, 32),
      body: Column(children: <Widget>[
        Expanded(
          child: Container(
            child: Column(
                //makeshow
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        ques,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        ans,
                        style: TextStyle(fontSize: 20),
                      ))
                ]),
          ),
        ),
        Expanded(
          flex: 3,
          child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (BuildContext context, int index) {
                if (index == 0 || index == 1) {
                  return MyButton(
                    buttonTapped: () {
                      if (index == 0) {
                        setState(() {
                          ques = '';
                        });
                      } else {
                        setState(() {
                          ques = ques.substring(0, ques.length - 1);
                        });
                      }
                    },
                    buttonText: buttons[index],
                    color: Color.fromARGB(255, 72, 84, 93),
                    textColor: Color.fromARGB(255, 159, 168, 176),
                  );
                } else {
                  return MyButton(
                    buttonTapped: () {
                      setState(() {
                        ques += buttons[index];
                      });
                    },
                    buttonText: buttons[index],
                    color: isOperator(buttons[index])
                        ? Color.fromARGB(255, 0, 93, 177)
                        : Color.fromARGB(255, 47, 49, 53),
                    textColor: Color.fromARGB(255, 68, 144, 193),
                  );
                }
              }),
        ),
      ]),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    } else {
      return false;
    }
  }
}
