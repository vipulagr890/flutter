import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Number extends StatefulWidget {
  const Number({Key? key}) : super(key: key);

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontsize = 36.0;
  double resultFontSize = 30.0;

  Widget buildButton(
      String buttontext, double buttonheight, Color buttonColor) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
      ),
      height: MediaQuery.of(context).size.height * 0.1 * buttonheight,
      child: TextButton(
        onPressed: () => buttonpressed(buttontext),
        child: Text(buttontext,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30)),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: buttonColor.withOpacity(0.1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0,backgroundColor: Colors.black.withOpacity(0.0),),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                result,
                style: TextStyle(fontSize: equationFontsize),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Text(
                equation,
                style:
                    TextStyle(fontSize: resultFontSize, color: Colors.white60),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Table(
                    children: [
                      TableRow(children: [
                        buildButton("AC", 1, Colors.lightBlue.shade300),
                        buildButton("⌫", 1, Colors.lightBlue.shade300),
                        buildButton("+/-", 1, Colors.lightBlue.shade300),
                        buildButton("÷", 1, Colors.lightBlue.shade300),
                      ]),
                      TableRow(children: [
                        buildButton("7", 1, Colors.black54),
                        buildButton("8", 1, Colors.black54),
                        buildButton("9", 1, Colors.black54),
                        buildButton("×", 1, Colors.lightBlue.shade300),
                      ]),
                      TableRow(children: [
                        buildButton("4", 1, Colors.black54),
                        buildButton("5", 1, Colors.black54),
                        buildButton("6", 1, Colors.black54),
                        buildButton("-", 1, Colors.lightBlue.shade300),
                      ]),
                      TableRow(children: [
                        buildButton("1", 1, Colors.black54),
                        buildButton("2", 1, Colors.black54),
                        buildButton("3", 1, Colors.black54),
                        buildButton("+", 1, Colors.lightBlue.shade300),
                      ]),
                      TableRow(children: [
                        buildButton("00", 1, Colors.black54),
                        buildButton("0", 1, Colors.black54),
                        buildButton(".", 1, Colors.lightBlue.shade300),
                        buildButton("=", 1, Colors.lightBlue.shade300),
                      ]),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  buttonpressed(String buttontext) {
    setState(() {
      if (buttontext == "AC") {
        equation = "0";
        result = "0";
      
      } else if (buttontext == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttontext == "=") {
        expression = equation;
        expression = expression.replaceAll("×", "*");
        expression = expression.replaceAll("÷", "/");

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "error";
        }
      } else {
        if (equation == "0") {
          equation = buttontext;
        } else {
          equation = equation + buttontext;
        }
      }
    });
  }
}
