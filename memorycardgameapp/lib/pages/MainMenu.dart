import 'dart:io';

import 'package:flutter/material.dart';
import 'home_page.dart';
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
      backgroundColor: Colors.cyan[100],
      body:Stack(
        children: <Widget>[
       /*   Center(
            child: new Image.asset(
              'images/bg.jpg',

              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
*/


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
                        "GuessPair ",
                        style: TextStyle(
                          fontSize: 58.0,
                          fontFamily: 'DancingScript',
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.green,
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
                              child: Text(" START",style: TextStyle(
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
      MaterialPageRoute(builder: (context) => Home()),
    );
  }



}
