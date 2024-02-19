import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String equation = '0';
  String expression = '';
  String result = '0';

  buttonPressd(btnText) {
    setState(() {
      if (btnText == 'AC') {
        equation = '0';
        result = '0';
      } else if (btnText == '⌫') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
      } else if (btnText == '=') {
        expression = equation;

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {}
      } else {
        if (equation == '0') {
          equation = btnText;
        } else {
          equation = equation + btnText;
        }
      }
    });
  }

  Widget calButtons(
      String btnText, Color textColor, double btnWinth, Color btnColor) {
    return InkWell(
      onTap: () {
        buttonPressd(btnText);
      },
      child: Container(
        height: 80,
        width: btnWinth,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          btnText,
          style: TextStyle(
              color: textColor, fontSize: 50, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent[100],
        title: const Text(
          'Calculator ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            height: 90,
            width: double.infinity,
            color: Colors.white,
            child: Text(
              equation,
              style: TextStyle(
                color: Colors.deepOrangeAccent[100],
                fontSize: 38,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            height: 90,
            width: double.infinity,
            color: Colors.white,
            child: Text(
              result,
              style: TextStyle(
                color: Colors.deepOrangeAccent[100],
                fontSize: 40,
              ),
            ),
          ),
          Padding(
            
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calButtons(
                        'AC', Colors.white, 80, Colors.deepOrangeAccent[100]!),
                    calButtons('⌫', Colors.white, 80, Colors.white38!),
                    calButtons('%', Colors.white, 80, Colors.white38!),
                    calButtons('/', Colors.white, 80, Colors.white38!),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calButtons('7', Colors.white, 80, Colors.white38!),
                    calButtons('8', Colors.white, 80, Colors.white38!),
                    calButtons('9', Colors.white, 80, Colors.white38!),
                    calButtons('*', Colors.white, 80, Colors.white38!),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calButtons('4', Colors.white, 80, Colors.white38!),
                    calButtons('5', Colors.white, 80, Colors.white38!),
                    calButtons('6', Colors.white, 80, Colors.white38!),
                    calButtons('-', Colors.white, 80, Colors.white38!),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calButtons('1', Colors.white, 80, Colors.white38!),
                    calButtons('2', Colors.white, 80, Colors.white38!),
                    calButtons('3', Colors.white, 80, Colors.white38!),
                    calButtons('+', Colors.white, 80, Colors.white38!),
                  ],
                ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    calButtons('0', Colors.white, 170,Colors.white38!),
                    calButtons('9', Colors.white, 80, Colors.white38!),
                    calButtons('=', Colors.white, 80, Colors.white38!),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
