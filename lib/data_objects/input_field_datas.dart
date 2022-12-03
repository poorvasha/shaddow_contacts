import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFieldObject {
  String labelName;
  String hintText;
  String errMessage;
  bool isValid;
  TextEditingController myController;
  TextInputType keyboardType;
  TextInputFormatter textInputType;

  InputFieldObject(this.labelName, this.hintText, this.errMessage, this.isValid,
      this.myController, this.keyboardType, this.textInputType);
}
