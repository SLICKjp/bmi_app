import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
final TextEditingController _ageController=TextEditingController();
final TextEditingController _heightController=TextEditingController();
final TextEditingController _weightController=TextEditingController();
double inches=0.0;
double result=0.0;
String resultReadig="";
String finalResult="";
void showResult()
 {
    setState(() {
         int age=int.parse(_ageController.text);
         double height=double.parse(_heightController.text),
         inches=(height*30.48)/100;
         double weight=double.parse(_weightController.text);

           if((_ageController.text.isNotEmpty || age >0)
           &&((_heightController.text.isNotEmpty ||  inches > 0)
           &&(_weightController.text.isNotEmpty || weight > 0)))
              {
                 result= weight/ (inches * inches);

                 if(double.parse(result.toStringAsFixed(1)) < 18.5)
                 {
                   resultReadig="UNDERWEIGHT";
                   print(resultReadig);
                 }
                  else if(double.parse(result.toStringAsFixed(1)) >= 18.5 &&
                        result <25)
                 {
                    resultReadig="GREAT SHAPE";
                    print(resultReadig);
                 }
                  else if(double.parse(result.toStringAsFixed(1)) > 25)
                    {
                      resultReadig='OVERWEIGHT';
                      print(resultReadig);
                    }
              }
           else
             {
               result=0.0;
             }
    });
          finalResult="Your BMI : ${result.toStringAsFixed(1)}";
 }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BMI'),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: new Container(
          alignment: Alignment.topCenter,
          child: new ListView(
            children: <Widget>[
              new Image.asset(
                'images/bmi.png',
                height: 90,
                width: 90,
              ),
          new Container(
             height: 300,
             width: 180,
             //color: Colors.black26,
          child: new Column(
            children: <Widget>[
              new TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                    borderRadius:BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                    borderRadius:BorderRadius.all(Radius.circular(30)),
                  ),
                  labelText: 'Age',
                  hintText: 'Enter your age',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  labelText: 'Height in feet',
                  hintText: 'enter your height',
                  prefixIcon: Icon(Icons.assessment),
                ),
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  labelText: 'Weight in kg',
                  hintText: 'enter your weight',
                  prefixIcon: Icon(Icons.toc),
                ),
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new Center(
                child: new Row(
                  children: <Widget>[
                    new Container(
                      margin: new EdgeInsets.only(left: 150.0),
                      child: new RaisedButton(
                          onPressed: showResult,
                          color: Colors.lightBlue,
                          child: new Text('Calculate',
                          style: new TextStyle(
                            fontSize: 18.5,
                          ),
                          ),
                      ),
                    ),


                  ],
                ),
              )

            ],
          ),

          ) ,
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("$finalResult",
                    style: new TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              new Padding(padding: EdgeInsets.all(5.5)),

              new Text("$resultReadig",
               textAlign: TextAlign.center,
               style: new TextStyle(
                 fontStyle: FontStyle.normal,
                 fontSize: 18.5,
               ),

              ),


            ],
          )),
    );
  }
}
