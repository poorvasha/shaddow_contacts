import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shadow_contacts/data_objects/input_field_datas.dart';

import 'appConstant.dart';
import 'data_objects/contact_details_obj.dart';
import 'widgets/input_field.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  List<InputFieldObject> inputFieldList = [
    InputFieldObject(
        "Name",
        "eg : Poorvasha Murugavel",
        "Please enter the Name",
        true,
        TextEditingController(),
        TextInputType.text,
        FilteringTextInputFormatter.singleLineFormatter),
    InputFieldObject(
        "Phone Number",
        "eg : 8838199417",
        "Please enter valid Phone Number",
        true,
        TextEditingController(),
        TextInputType.phone,
        FilteringTextInputFormatter.digitsOnly),
  ];

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(150, 36),
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Add Contact",
          style: TextStyle(fontSize: 24),
        )),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 30, top: 60, right: 30, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: inputFieldList.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: InputField(
                      labelName: inputFieldList[index].labelName,
                      hintText: inputFieldList[index].hintText,
                      errMessage: inputFieldList[index].errMessage,
                      isValid: inputFieldList[index].isValid,
                      myController: inputFieldList[index].myController,
                      keyboardType: inputFieldList[index].keyboardType,
                      textInputType: inputFieldList[index].textInputType,
                    ),
                  );
                }),
            Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed: saveContact,
                child: Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void saveContact() {
    try {
      int validFieldCount = 0;
      String phoneNumber = "";
      String name = "";
      if (inputFieldList.isNotEmpty) {
        for (var element in inputFieldList) {

          if (element.labelName == "Name") {
            name = element.myController!.text;
            if (element.myController!.text.isEmpty) {
              setState(() {
                element.isValid = false;
              });
            } else {
              setState(() {
                element.isValid = true;
                validFieldCount++;
              });
            }
          } 
          else if (element.labelName == "Phone Number") {
            
            phoneNumber = element.myController!.text;
            String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
            RegExp regExp = new RegExp(patttern);

            if (phoneNumber.isEmpty ||
                phoneNumber.length < 10 ||
                !regExp.hasMatch(phoneNumber)) {
              setState(() {
                element.isValid = false;
              });
            } else {
              setState(() {
                element.isValid = true;
                validFieldCount++;
              });
            }
          }

          if(validFieldCount == 2){
            setState(() {
                contactList.add(ContactDetailsObject(name, phoneNumber));
              });
            Navigator.pop(context, contactList);
          }
        }
      }
    } catch (e) {
      Exception(e);
    }
  }
}
