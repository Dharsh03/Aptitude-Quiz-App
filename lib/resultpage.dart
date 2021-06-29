import 'package:flutter/material.dart';
import 'package:quiz/Home.dart';

class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key key, @required this.marks}) : super(key: key);
  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {
  List<String> images = [
    "images/success.png",
    "images/good.png",
    "images/bad.png",
  ];

  String message;
  String image;

  @override
  void initState() {
    if (marks < 20) {
      image = images[2];
      message = "You Should Try Hard..\n" + "You Scored $marks";
    } else if (marks < 40) {
      image = images[1];
      message = "You Can Do Better..\n" + "You Scored $marks";
    } else {
      image = images[0];
      message = "You Did Very Well..\n" + "You Scored $marks";
    }
    super.initState();
  }

  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
          style: TextStyle(
              fontFamily: "Satisfy", fontSize: 26, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Material(
                elevation: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/images.jpg"),
                          fit: BoxFit.cover)),
                  child: Column(
                    children: <Widget>[
                      Material(
                        child: Container(
                          width: 300, height: 300,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xff000000),
                                    Color(0xff000f3e)
                                  ],
                                  stops: [
                                    0.21810686653771708,
                                    1
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              image: DecorationImage(
                                image: AssetImage(
                                  image,
                                ),
                              )),
                          // width: 300.0,
                          // color: Colors.black,
                          // height: 300.0,
                          // child: ClipRect(
                          //   child: Image(
                          //     image: AssetImage(
                          //       image,
                          //     ),
                          //     fit: BoxFit.contain,
                          //   ),
                          // ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 45.0,
                            horizontal: 15.0,
                          ),
                          child: Center(
                            child: Text(
                              message,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "Quando",
                                color: Colors.white,
                              ),
                            ),
                          )),
                      OutlineButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: "Quando"),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 25.0,
                        ),
                        borderSide: BorderSide(width: 1.0, color: Colors.white),
                        splashColor: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(250, 120, 0, 0),
                        child: Text("Dharshan Kumar",
                            style: TextStyle(
                                fontFamily: "Satisfy",
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
