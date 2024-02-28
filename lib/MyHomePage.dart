import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.themeData});

  final String title;
  final ThemeData themeData;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum gameChoices {
  rock,
  paper,
  scissor,
}

class _MyHomePageState extends State<MyHomePage> {
  var playerCard = " ";
  var pcCard = " ";
  var result = " ";

  void playerTurn(gameChoices gameChoice) {
    setState(() {
      playerCard = gameChoice.name.toString();
    });

    pcTurn();
    roundResult();
  }

  void pcTurn() {
    setState(() {
      final randomChoice =
          gameChoices.values[Random().nextInt(gameChoices.values.length)];
      pcCard = randomChoice.name.toString();
    });
  }

  void roundResult() {
    setState(() {
      if (pcCard == playerCard) {
        result = "Draw";
      } else {
        switch (playerCard) {
          case "rock":
            if (pcCard == "paper") {
              result = "PC wins";
            } else {
              result = "You win!";
            }
          case "paper":
            if (pcCard == "scissor") {
              result = "PC wins";
            } else {
              result = "You win!";
            }
          case "scissor":
            if (pcCard == "rock") {
              result = "PC wins";
            } else {
              result = "You win!";
            }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: widget.themeData,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Rock Paper Scissor Game"),
          ),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(),
                      ),
                      child: Text(
                        playerCard,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(),
                      ),
                      child: Text(
                        pcCard,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: 200.0,
                  height: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    border: Border.all(),
                  ),
                  child: Text(
                    result,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ])),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () => playerTurn(gameChoices.rock),
                tooltip: "Rock",
                child: const Text(
                  "Rock",
                ),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () => playerTurn(gameChoices.paper),
                tooltip: "Paper",
                child: const Text(
                  "Paper",
                ),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () => playerTurn(gameChoices.scissor),
                tooltip: "Scissor",
                child: const Text(
                  "Scissor",
                ),
              )
            ],
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
