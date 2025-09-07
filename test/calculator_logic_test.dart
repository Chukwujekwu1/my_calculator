import 'package:flutter_test/flutter_test.dart';
import 'package:my_calculator/components/calculator_logic.dart';

void main() {
  test('Addition works', () {
    expect(calculate(1, 2, '+'), 3);
  });

  test('Subtraction works', () {
    expect(calculate(5, 3, '-'), 2);
  });

  test('Multiplication works', () {
    expect(calculate(2, 4, 'x'), 8);
  });

  test('Division works', () {
    expect(calculate(8, 2, '÷'), 4);
  });

  test('Division by zero returns null', () {
    expect(calculate(8, 0, '÷'), null);
  });
}
