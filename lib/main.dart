import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RockPaperScissors(),
    );
  }
}

class RockPaperScissors extends StatefulWidget {
  @override
  _RockPaperScissorsState createState() => _RockPaperScissorsState();
}

class _RockPaperScissorsState extends State<RockPaperScissors> {
  Random rnd = new Random();
  int n, userScore = 0, computerScore = 0;
  var computerCh = '', userCh = '';

  void generateRandome() {
    setState(() {
      n = rnd.nextInt(3);
      if (n == 0) {
        computerCh = '✊';
      } else if (n == 1) {
        computerCh = '🖐️';
      } else if (n == 2) {
        computerCh = '✌️';
      }
    });
  }

  void rockClicked() {
    setState(() {
      userCh = '✊';
    });
  }

  void paperClicked() {
    setState(() {
      userCh = '🖐️';
    });
  }

  void scissorsClicked() {
    setState(() {
      userCh = '✌️';
    });
  }

  void chk() {
    setState(() {
      if (userCh == computerCh) {
      } else if (userCh == '✊' && computerCh == '🖐️') {
        computerScore++;
      } else if (userCh == '✊' && computerCh == '✌️') {
        userScore++;
      } else if (userCh == '🖐️' && computerCh == '✌️') {
        computerScore++;
      } else if (userCh == '🖐️' && computerCh == '✊') {
        userScore++;
      } else if (userCh == '✌️' && computerCh == '✊') {
        computerScore++;
      } else if (userCh == '✌️' && computerCh == '🖐️') {
        userScore++;
      }
    });
  }

  void clearAll() {
    setState(() {
      userCh = '';
      computerCh = '';
      userScore = 0;
      computerScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rock Paper Scissors"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: clearAll),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.00),
        child: Stack(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("Computer score"),
                      Text(
                        "$computerScore",
                        style: TextStyle(fontSize: 40.00),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("Your score"),
                      Text(
                        "$userScore",
                        style: TextStyle(fontSize: 40.00),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 80.00),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Computer",
                    style: TextStyle(fontSize: 25.00),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 120.00),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RotationTransition(
                    turns: AlwaysStoppedAnimation(180 / 360),
                    child: Text(
                      "$computerCh",
                      style: TextStyle(fontSize: 75.00),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 180.00),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "$userCh",
                      style: TextStyle(fontSize: 75.00),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 140.00),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "You",
                      style: TextStyle(fontSize: 25.00),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        generateRandome();
                        rockClicked();
                        chk();
                      },
                      child: Text(
                        "Rock",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      height: 100,
                      minWidth: 100,
                    ),
                    MaterialButton(
                      onPressed: () {
                        generateRandome();
                        paperClicked();
                        chk();
                      },
                      child: Text(
                        "Paper",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      height: 100,
                      minWidth: 100,
                    ),
                    MaterialButton(
                      onPressed: () {
                        generateRandome();
                        scissorsClicked();
                        chk();
                      },
                      child: Text(
                        "Scissors",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      height: 100,
                      minWidth: 100,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
