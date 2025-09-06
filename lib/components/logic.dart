// // Stores the raw user input from the calculator buttons
// String input = ''; // raw user input
// // Stores the output to be displayed on the calculator screen
// String output = ''; // what to display
// // Stores the first operand for calculations
// double? firstNum;
// // Stores the second operand for calculations
// double? secondNum;
// // Stores the selected operator (+, -, x, ÷)
// String? operator;

// // Handles logic when a calculator button is pressed
// void buttonPressed(String value) {
//   // If 'AC' is pressed, reset all values
//   if (value == "AC") {
//     input = "";
//     output = "";
//     firstNum = null;
//     secondNum = null;
//     operator = null;
//   // If an operator is pressed, store the first number and operator
//   } else if (value == "+" || value == "-" || value == "x" || value == "÷") {
//     firstNum = double.tryParse(input);
//     operator = value;
//     input = "";
//   // If '=' is pressed, perform the calculation
//   } else if (value == "=") {
//     secondNum = double.tryParse(input);
//     // Check if both numbers and operator are valid
//     if (firstNum != null && secondNum != null && operator != null) {
//       switch (operator) {
//         case "+":
//           // Addition
//           output = (firstNum! + secondNum!).toString();
//           break;
//         case "-":
//           // Subtraction
//           output = (firstNum! - secondNum!).toString();
//           break;
//         case "x":
//           // Multiplication
//           output = (firstNum! * secondNum!).toString();
//           break;
//         case "÷":
//           // Division, handle division by zero
//           if (secondNum == 0) {
//             output = "Error";
//           } else {
//             output = (firstNum! / secondNum!).toString();
//           }
//           break;
//       }
//       // Reset for new input after calculation
//       input = "";
//       firstNum = null;
//       secondNum = null;
//       operator = null;
//     } else {
//       // If not a valid calculation, append value to input and show it
//       input += value;
//       output = input;
//     }
//   }
// }
