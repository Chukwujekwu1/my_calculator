import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_calculator/components/calculator_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // final digits = {};

  // Stores the raw user input from the calculator buttons
  String display = "";
  String input = ''; // raw user input
  // Stores the output to be displayed on the calculator screen
  String output = ''; // what to display
  // Stores the first operand for calculations
  double? firstNum;
  // Stores the second operand for calculations
  double? secondNum;
  // Stores the selected operator (+, -, x, ÷)
  String? operator;



  String formatResult(double result) {
  if (result % 1 == 0) {
    // whole number, no decimals
    return result.toInt().toString();
  } else {
    // keep decimals
    return result.toString();
  }
}


  // Handles logic when a calculator button is pressed asynchronously
  // Uses Future and async to allow for non-blocking UI and possible heavy computation
  Future<void> buttonPressed(String value) async {
    // Simulate async work (can be replaced with real async logic)
    await Future.delayed(Duration(milliseconds: 10));
    setState(() {
      // Reset all values if 'AC' is pressed
      if (value == "AC") {
        display = "";
        input = "";
        output = "";
        firstNum = null;
        secondNum = null;
        operator = null;
      } 
      // Remove last character if 'C' is pressed
      else if (value == "C") {
        if (display.isNotEmpty) {
          display = display.substring(0, display.length - 1);
          input = input.isNotEmpty ? input.substring(0, input.length - 1) : "";
        }
      } 
      // Calculate square root if '√' is pressed
      else if (value == "√") {
        double? num = double.tryParse(input.isNotEmpty ? input : output);
        if (num != null) {
          output = (num >= 0) ? formatResult(sqrt(num)) : "Error"; 
          display = output;
          input = output;
        }
      }
      // Calculate percentage if '%' is pressed
      else if (value == "%") {
        double? num = double.tryParse(input.isNotEmpty ? input : output);
        if (num != null) {
          output = formatResult(num / 100);
          display = output;
          input = output;
        }
      }
      // Handle arithmetic operators
      else if (value == "+" || value == "-" || value == "x" || value == "÷") {
        // Use output as firstNum if chaining, otherwise use input
        if (output.isNotEmpty && input.isEmpty) {
          firstNum = double.tryParse(output);
        } else {
          firstNum = double.tryParse(input);
        }
        operator = value;
        display += value;
        input = "";
      } 
      // Perform calculation if '=' is pressed
      else if (value == "=") {
        secondNum = double.tryParse(input);
        if (firstNum != null && secondNum != null && operator != null) {
          switch (operator) {
            case "+": output = formatResult(firstNum! + secondNum!); break;
            case "-": output = formatResult(firstNum! - secondNum!); break;
            case "x": output = formatResult(firstNum! * secondNum!); break;
            case "÷":
              output = secondNum == 0 ? "Error" : formatResult(firstNum! / secondNum!);
              break;
          }
          display = output;
          input = output;
          firstNum = null;
          secondNum = null;
          operator = null;
        }
      } 
      // Handle numbers and decimal point
      else {
        input += value;
        display += value;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Text(
                display,
                style: TextStyle(color: Colors.white, fontSize: 48),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 17,
                    children: [
                      for (var entry in [
                        "AC",
                        "C",
                        "√",
                        "÷",
                        "7",
                        "8",
                        "9",
                        "x",
                        "4",
                        "5",
                        "6",
                        "-",
                        "1",
                        "2",
                        "3",
                        "+",
                        "0",
                        "%",
                        ".",
                        "=",
                      ].asMap().entries)
                        CalculatorButton(
                          text: entry.value,
                          color: (entry.key == 1 || entry.key == 0 || entry.key == 2)
                              ? Colors.grey
                              : (entry.key == 3 ||
                                        entry.key == 7 ||
                                        entry.key == 11 ||
                                        entry.key == 15 ||
                                        entry.key == 19
                                    ? Colors.orange
                                    : const Color.fromARGB(255, 62, 62, 62)),
                          // Use setState to update UI when button is pressed
                          onTap: () => setState(() {
                            buttonPressed(entry.value);
                          }),
                        ),
                    ],
                  ),
                ),
                Text("Developed by Chukwujekwu",style: TextStyle(color: Colors.blueGrey),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
