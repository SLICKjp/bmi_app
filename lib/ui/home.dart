import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String resultReadig = "";
  String finalResult = "";
  String errMsg = "Something Is Missing!!";
  String shape = "";
  bool isError = false;

  void showResult() {

      if ((_ageController.text == "") ||
          ((_heightController.text == "") ||
              (_weightController.text == ""))) {

        setState(() {
          isError = true;
          resultReadig = errMsg;

        });

      } else {
        isError = false;
        int age = int.parse(_ageController.text);
        double heightValue = double.parse(_heightController.text),
            height = (heightValue * 30.48) / 100;
        double weight = double.parse(_weightController.text);

        result = weight / (height * height);

        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          shape = "UNDERWEIGHT";
//          print(resultReadig);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          shape = "GREAT SHAPE";
//          print(resultReadig);
        } else if (double.parse(result.toStringAsFixed(1)) > 25) {
          shape = 'OVERWEIGHT';
//          print(resultReadig);
        }

        setState(() {
          resultReadig = shape;
        });
      }
    finalResult = "Your BMI : ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI Finder',
            style: TextStyle(fontSize: 26),
          ),
          backgroundColor: Colors.lightBlueAccent,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/body-mass.png'),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: <Widget>[
              SizedBox(
                height: 55,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 0.4 * MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Age',
                      labelStyle: TextStyle(color: Colors.lightBlue),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 0.4 * MediaQuery.of(context).size.width,
                child: TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'Height in ft',
                    labelStyle: TextStyle(color: Colors.lightBlue),
                    prefixIcon: Icon(Icons.assessment),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 0.4 * MediaQuery.of(context).size.width,
                child: TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'Weight in kg',
                    labelStyle: TextStyle(color: Colors.lightBlue),
                    prefixIcon: Icon(Icons.toc),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: showResult,
                color: Colors.lightBlue,
                textColor: Colors.white,
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 18.5,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Visibility(
                visible: isError == true ? false : true,
                child: Text(
                  "$finalResult",
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.5)),
              Text(
                "$resultReadig",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 18.5,
                ),
              )
            ]),
          ),
        ));
  }
}
