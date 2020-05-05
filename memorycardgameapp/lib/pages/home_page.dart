import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

int level = 8;

class Home extends StatefulWidget {
  final int size;

  const Home({Key key, this.size = 8}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<GlobalKey<FlipCardState>> cardStateKeys = [];
  List<bool> cardFlips = [];
  List<String> data = [];
  int previousIndex = -1;
  bool flip = false;

  int time = 0;
  Timer timer;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.size; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
      cardFlips.add(true);
    }
    for (var i = 0; i < widget.size ~/ 2; i++) {
      data.add(i.toString());
    }
    for (var i = 0; i < widget.size ~/ 2; i++) {
      data.add(i.toString());
    }
    startTimer();
    data.shuffle();
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        time = time + 1;
      });
    });
  }

  stopTimer(){
    timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child:Padding(
            padding: EdgeInsets.only(top: 10),

            child:
            Column(
              children: <Widget>[

                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child:
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent),
                            shape: BoxShape.circle),
                        width: 70.0,
                        height: 50.0,
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "$time",
                                  style: TextStyle(color: Colors.red
                                      ,
                                      fontSize: 18),
                                )
                              ],
                            )),
                      ),
                    ),

                    Container(   padding: EdgeInsets.only(left: 20),
                      width:180.0,
                      height: 50.0,
                      child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Think and Flip :)",
                                style: TextStyle(color: Colors.purple
                                    ,
                                    fontSize: 18),
                              )
                            ],
                          )),
                    ),
                  ],
                ),


                Theme(
                  data: ThemeData.dark(),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) => FlipCard(
                        key: cardStateKeys[index],
                        onFlip: () {
                          if (!flip) {
                            flip = true;
                            previousIndex = index;
                          } else {
                            flip = false;
                            if (previousIndex != index) {
                              if (data[previousIndex] != data[index]) {
                                cardStateKeys[previousIndex]
                                    .currentState
                                    .toggleCard();
                                previousIndex = index;
                              } else {
                                cardFlips[previousIndex] = false;
                                cardFlips[index] = false;
                                print(cardFlips);

                                if (cardFlips.every((t) => t == false)) {
                                  print("Won");
                                  showResult();
                                  stopTimer();
                                }
                              }
                            }
                          }
                        },
                        direction: FlipDirection.HORIZONTAL,
                        flipOnTouch: cardFlips[index],
                        front: Container(
                          margin: EdgeInsets.all(4.0),
                          color: Colors.cyan,
                        ),
                        back: Container(
                          margin: EdgeInsets.all(4.0),
                          color: Colors.indigoAccent,
                          child: Center(
                            child: Text(
                              "${data[index]}",
                              style: Theme.of(context).textTheme.display2,
                            ),
                          ),
                        ),
                      ),
                      itemCount: data.length,
                    ),
                  ),
                ),
              ],
            ),
          ),



        ),
      ),
    );
  }

  showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Congratulations You Won This Level",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.purpleAccent
        ),),
        content: Text(
          "Time : $time",
          style: TextStyle(
            fontSize: 18

          ),

        ),

        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Home(
                    size: level,
                  ),
                ),
              );
              level *= 2;
            },
            child: Text("NEXT Level"),
          ),
        ],
      ),
    );
  }
}