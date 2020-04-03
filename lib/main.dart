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
  var computerCh = '', userCh = '', userEmoji = '', computerEmoji = '';

  void generateRandome() {
    setState(() {
      n = rnd.nextInt(3);
      if (n == 0) {
        computerCh = 'r';
      } else if (n == 1) {
        computerCh = 'p';
      } else if (n == 2) {
        computerCh = 's';
      }
    });
  }

  void rockClicked() {
    setState(() {
      userCh = 'r';
    });
  }

  void paperClicked() {
    setState(() {
      userCh = 'p';
    });
  }

  void scissorsClicked() {
    setState(() {
      userCh = 's';
    });
  }

  void chk() {
    setState(() {
      if (userCh == computerCh) {
      } else if (userCh == 'r' && computerCh == 'p') {
        computerScore++;
      } else if (userCh == 'r' && computerCh == 's') {
        userScore++;
      } else if (userCh == 'p' && computerCh == 's') {
        computerScore++;
      } else if (userCh == 'p' && computerCh == 'r') {
        userScore++;
      } else if (userCh == 's' && computerCh == 'r') {
        computerScore++;
      } else if (userCh == 's' && computerCh == 'p') {
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
            Positioned(
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
            Positioned(
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("Computer"),
                        Text(
                          "$computerCh",
                          style: TextStyle(fontSize: 40.00),
                        ),
                        Text(
                          "$userCh",
                          style: TextStyle(fontSize: 40.00),
                        ),
                        Text("You"),
                      ],
                    )
                    // Text("Computer: $computerCh"),
                    // Text("You: $userCh"),
                  ],
                ),
              ),
            ),
            Positioned(
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
                      child: Text("Rock"),
                      color: Colors.grey,
                      height: 100,
                      minWidth: 100,
                    ),
                    MaterialButton(
                      onPressed: () {
                        generateRandome();
                        paperClicked();
                        chk();
                      },
                      child: Text("Paper"),
                      color: Colors.yellow,
                      height: 100,
                      minWidth: 100,
                    ),
                    MaterialButton(
                      onPressed: () {
                        generateRandome();
                        scissorsClicked();
                        chk();
                      },
                      child: Text("Scissors"),
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
