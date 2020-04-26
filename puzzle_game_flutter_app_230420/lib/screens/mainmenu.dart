import 'dart:io';
import 'mathpuzlze.dart';
import 'package:flutter/material.dart';
import 'mathpuzle5.dart';
class MainMenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainMenuState();
  }

}

class MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:Stack(
          children: <Widget>[
            Center(
              child: new Image.asset(
                'images/bg.jpg',

                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),



            Container(
              margin: EdgeInsets.only(top:30.0,left: 30,right: 30,bottom: 7),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "2048 ",
                          style: TextStyle(
                            fontSize: 69.0,
                            fontFamily: 'DancingScript',
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50, right: 50, top: 200),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                                textColor: Colors.white,
                                color: Colors.lightBlue,
                                child: Text(" PLAY  4 x 4",style: TextStyle(
                                    fontSize: 16
                                ),),
                                onPressed: () {
                                  NavigateToDetails();
                                },
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50, right: 50,),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                                textColor: Colors.black,
                                color: Colors.white,
                                child: Text(" PLAY  5 x 5",style: TextStyle(
                                    fontSize: 16
                                ),),
                                onPressed: () {
                                NavigateToDetails5x5();
                                },
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child:  RaisedButton(
                                textColor: Colors.white,
                                color: Colors.red,
                                child: Text("Exit" ,style: TextStyle(
                                    fontSize: 16
                                ),),
                                onPressed: () {
                                  exit(0);
                                },
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),







    );
  }

  void NavigateToDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }


void NavigateToDetails5x5() {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyApp5()),
  );
}
}
