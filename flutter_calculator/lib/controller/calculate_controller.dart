import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateController extends GetxController {
  /* 
  UserInput = What User entered with the keyboard .
  UserOutput = Calculate the numbers that the user entered and put into userOutPut variable.
  */
  var userInput = "";
  var userOutput = "";
  String onesComplement(String binary) {
    return binary.replaceAllMapped(
        RegExp('[01]'), (match) => match.group(0) == '0' ? '1' : '0');
  }

  String twosComplement(String binary) {
    String onesComp = onesComplement(binary);
    int carry = 1;
    String result = '';

    for (int i = onesComp.length - 1; i >= 0; i--) {
      int sum = int.parse(onesComp[i]) + carry;
      result = '${sum % 2}$result';
      carry = sum ~/ 2;
    }

    return result;
  }

  String signMagnitude(String binary) {
    String sign = binary[0] == '0' ? '+' : '-';
    String magnitude = binary.substring(1);
    return '$sign$magnitude';
  }

  String unsignedMagnitude(String binary) {
    return binary;
  }



  /// Equal Button Pressed Func
  equalPressed() {
    String userInputFC = userInput;
    userInputFC = userInputFC.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(userInputFC);
    ContextModel ctx = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, ctx);

    userOutput = eval.toString();
    update();
  }

  /// Clear Button Pressed Func
  clearInputAndOutput() {
    userInput = "";
    userOutput = "";
    update();
  }

  /// Delete Button Pressed Func
  deleteBtnAction() {
    userInput = userInput.substring(0, userInput.length - 1);
    update();
  }

  /// on Number Button Tapped
  onBtnTapped(List<String> buttons, int index) {
    userInput += buttons[index];
    update();
  }
  void onSpecialBtnTapped(List<String> buttons, int index) {
    switch (buttons[index]) {
      case "1's":
        applyUnaryOperation(onesComplement);
        break;
      case "2's":
        applyUnaryOperation(twosComplement);
        break;
      case "Sign":
        applyUnaryOperation(signMagnitude);
        break;
      case "Unsigned":
        applyUnaryOperation(unsignedMagnitude);
        break;
    }
  }

  void applyUnaryOperation(String Function(String) operation) {
    try {
      userOutput = operation(userInput);
    } catch (e) {
      userOutput = 'Error';
    }
  }

}
