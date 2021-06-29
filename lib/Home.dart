import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/quizpage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    "images/problemontrain.png",
    "images/heightanddistance.png",
    "images/simpleinterest.png",
    "images/profitandloss.png",
    "images/percentage.png",
  ];
  List<String> desc = [
    "Train problems are specifically based on evaluating the speed, distance covered and time is taken by a train under different conditions.",
    "Height is the measurement of an object in the vertical direction and distance is the measurement of an object from a particular point in the horizontal direction.",
    "Simple interest is a quick and easy method of calculating the interest charge on a loan. Simple interest is determined by multiplying the daily interest rate by the principal by the number of days that elapse between payments.",
    "The profit and loss (P&L) statement is a financial statement that summarizes the revenues, costs, and expenses incurred during a specified period, usually a fiscal quarter or year. The P&L statement is synonymous with the income statement.",
    "A percentage is a number or ratio that can be expressed as a fraction of 100. If we have to calculate percent of a number, divide the number by whole and multiply by 100.",
  ];

  Widget customcard(String langname, String image, String desc) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => getjson(langname),
          ));
        },
        child: Material(
          color: Colors.grey.shade800,
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Image(
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                      image: AssetImage(image)),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Quando"),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      desc,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade400,
                          fontFamily: "Times New Roman"),
                      textAlign: TextAlign.justify,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Aptitude Quiz',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Satisfy",
                fontSize: 26),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/images.jpg"), fit: BoxFit.cover)),
          child: ListView(
            children: <Widget>[
              customcard("Problems on Train", images[0], desc[0]),
              customcard("Height and Distance", images[1], desc[1]),
              customcard("Simple Interest", images[2], desc[2]),
              customcard("Profit and Loss", images[3], desc[3]),
              customcard("Percentage", images[4], desc[4]),
            ],
          ),
        ));
  }
}
