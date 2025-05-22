import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size = 0;
  String inputVal ="";
  String calVal = "";
  String operator = "";
  double size2 = 0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 6;
    size2 = MediaQuery.of(context).size.width / 6;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            
            Container(
              child: Text(inputVal,
                style: TextStyle(fontSize: 100, color: Colors.white),
              ),
              alignment: Alignment.bottomRight,
            ),
            Column(
              children: [
                Row(
                  children: [
                    calcButton("7", Colors.white38),
                    calcButton("8", Colors.white38),
                    calcButton("9", Colors.white38),
                    calcButton("/", Colors.orange),
                  ],
                ),

                Row(
                  children: [
                    calcButton("6", Colors.white38),
                    calcButton("5", Colors.white38),
                    calcButton("4", Colors.white38),
                    calcButton("*", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton("3", Colors.white38),
                    calcButton("2", Colors.white38),
                    calcButton("1", Colors.white38),
                    calcButton("/", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton("0", Colors.white38),
                    calcButton(".", Colors.white38),
                    calcButton("=", Colors.orange),
                    calcButton("+", Colors.orange),
                  ],
                ),
              ],
            ),
            calcButton("clear", Colors.black),
          ],
        ),
      ),
    );
  }

  Widget calcButton(String text, Color bgColor) {
    return InkWell(
      onTap: (){
        if(text == "clear"){
          setState(() {
            inputVal = "";
          });
        }
        else if(text == "+"||text == "-"||text == "*"||text=="/"){
          setState(() {
            operator = text;
            calVal = inputVal;
            inputVal="";
          });

        }
        else if(text == "="){
          setState(() {
            switch(operator){
              case "+":
                inputVal = (double.parse(calVal)+double.parse(inputVal)).toString();
                break;
              case "-":
                inputVal = (double.parse(calVal)-double.parse(inputVal)).toString();
                break;
              case "*":
                inputVal = (double.parse(calVal)*double.parse(inputVal)).toString();
                break;
              case "/":
                inputVal = (double.parse(calVal)/double.parse(inputVal)).toString();
                break;
            }
          });
        }
        else{
          setState(() {
          inputVal = inputVal+text;
        });
        }
        
      },
      child: Container(
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 30)),
        height: size,
        width: size2,
        alignment: Alignment.center,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
