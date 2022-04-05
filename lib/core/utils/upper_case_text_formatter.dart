import 'package:flutter/services.dart';
import 'package:turkish/turkish.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCaseTr(),
      selection: newValue.selection,
    );
  }
}
