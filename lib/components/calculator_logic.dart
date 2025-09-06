// Pure calculator logic for testing

double? calculate(double firstNum, double secondNum, String operator) {
  switch (operator) {
    case '+':
      return firstNum + secondNum;
    case '-':
      return firstNum - secondNum;
    case 'x':
      return firstNum * secondNum;
    case '÷':
      return secondNum == 0 ? null : firstNum / secondNum;
    default:
      return null;
  }
}
