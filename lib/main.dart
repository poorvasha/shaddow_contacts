import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'data_objects/contact_details_obj.dart';
import 'widgets/contact_card_view.dart';

// app starts here
void main() {
  runApp(const MyApp());
}

// material app starts here which is the root of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shadow Contacts',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Shadow Contacts'),
    );
  }
}

// HomePage stateful widget with param title
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Homepage widget which exends the state of statefull homepage class
class _MyHomePageState extends State<MyHomePage> {
  // Contact list declaration;
  List<ContactDetailsObject> contactList = 
  [
    ContactDetailsObject("Poorva", "8838199417"),
    ContactDetailsObject("Yuva", "9944937052"),
    ContactDetailsObject("Appa", "8838199417"),
    ContactDetailsObject("Amma", "9159032768")
  ];

// HomePage widget starts here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.title,
          style: TextStyle(fontSize: 24),
        )),
      ),
      body: Center(
          child: contactList.isNotEmpty
              ? ListView.builder(
                  itemCount: contactList.length,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  itemBuilder: (BuildContext context, index) {
                    return ContactCardView(contactDetails: contactList[index]);
                  })
              : Center(
                  child: Wrap(
                    spacing: 30,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    children: [
                      SvgPicture.asset(
                        'assets/images/not_found.svg',
                        width: 150,
                        height: 150,
                      ),
                      const Text("No Contacts Found")
                    ],
                  ),
                )),

      floatingActionButton: FloatingActionButton(
        onPressed: onPressedAddButton,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void onPressedAddButton() {
    try {
      
    } catch (e) {
      Exception(e);
    }
  }
}
