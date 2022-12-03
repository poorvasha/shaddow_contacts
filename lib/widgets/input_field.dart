import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputField extends StatefulWidget {
  InputField(
      {super.key,
      required this.labelName,
      required this.hintText,
      required this.errMessage,
      required this.isValid,
      required this.myController,
      required this.keyboardType,
      required this.textInputType});
  late String labelName;
  late String hintText;
  late String errMessage;
  late bool isValid;
  late TextEditingController? myController;
  late TextInputType keyboardType;
  late TextInputFormatter textInputType;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      runSpacing: 15,
      children: [
        Text(
          widget.labelName,
          style: const TextStyle(
              fontSize: 18,
              color:
                   Color.fromARGB(221, 20, 20, 20),
              fontWeight: FontWeight.bold),
        ),
        Material(
          elevation: 4,
          shadowColor: widget.isValid ? Color.fromARGB(255, 132, 114, 163) : Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: TextField(
            keyboardType: widget.keyboardType,
            inputFormatters: [widget.textInputType],
            controller: widget.myController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20),
              border: InputBorder.none,
              hintText: widget.hintText,
            ),
          ),
        ),
        if (!widget.isValid)
          Text(
            widget.errMessage,
            style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 255, 63, 63),
                fontWeight: FontWeight.normal),
          ),
        
      ],
    );
  }
}
