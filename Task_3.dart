import 'dart:io';

class Calculator {
  var num1, num2;

  Calculator(this.num1, this.num2) {}

  double addition() {
    return num1 + num2;
  }

  double subtraction() {
    return num1 - num2;
  }

  double multiplication() {
    return num1 * num2;
  }

  double division() {
    if (num2 == 0) {
      throw Exception('Error: Divison by zero!');
    }
    return num1 / num2;
  }
}

Future<double?> time(double? out) {
  return Future.delayed(Duration(seconds: 5), () => out);
}

void main() async {
  print("Enter the first number: ");
  double num1 = double.parse(stdin.readLineSync()!);
  print("Enter the operation you want ['/', '*', '+', '-']: ");
  String? op = stdin.readLineSync();
  print("Enter the second number: ");
  double num2 = double.parse(stdin.readLineSync()!);
  Calculator client = Calculator(num1, num2);
  double? out;
  try {
    switch (op) {
      case "+":
        out = client.addition();
        break;
      case "-":
        out = client.subtraction();
        break;
      case "/":
        out = client.division();
        break;
      case "*":
        out = client.multiplication();
        break;
      default:
        print("wrong input!");
    }
    print("The result is: ${await time(out)}");
  } catch (e) {
    print(e);
  }
}