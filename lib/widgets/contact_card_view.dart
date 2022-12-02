import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../data_objects/contact_details_obj.dart';

class ContactCardView extends StatefulWidget {
  ContactCardView({super.key, required this.contactDetails});

  late ContactDetailsObject contactDetails;

  @override
  State<ContactCardView> createState() => _ContactCardViewState();
}

class _ContactCardViewState extends State<ContactCardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white,
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.vertical,
              children: [
                Container(
                  child: Text(
                    widget.contactDetails.name,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                Container(
                  child: Text(
                    widget.contactDetails.phoneNumber,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                )
              ],
            ),
            FloatingActionButton(
                mini: true,
                backgroundColor: Colors.black54,
                elevation: 0,
                onPressed: onPressed,
                child: SpeedDial(
                  direction: SpeedDialDirection.left,
                  overlayOpacity: 0.2,
                  backgroundColor: Colors.black12,
                  elevation: 0,
                  buttonSize: const Size(200, 200),
                  childrenButtonSize: const Size(50, 50),
                  icon: Icons.arrow_back,
                  children: [
                    SpeedDialChild(
                      elevation: 0,
                      foregroundColor: Colors.blue,
                      onTap: onPhoneTapped,
                      child: const Icon(Icons.phone_rounded),
                    ),
                    SpeedDialChild(
                        elevation: 0,
                        foregroundColor: Colors.green,
                        onTap: onWhatsappTapped,
                        child: const Icon(Icons.whatsapp_rounded))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void onPressed() {}

  void onPhoneTapped() {
    try {
      
    } catch (e) {
      Exception(e);
    }
  }

  void onWhatsappTapped() {
    try {
      
    } catch (e) {
      Exception(e);
    }
  }
}
