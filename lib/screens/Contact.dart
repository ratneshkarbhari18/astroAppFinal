import 'package:flutter/material.dart';
// import '../templates/AppBarTemplate.dart';
// import '../templates/DrawerTemplate.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  _ContactState();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DrawerTemplate(),
      // appBar: AppBarTemplate(this.name),
      body: ContactPage(),
    );
  }
}

class ContactPage extends StatefulWidget {


  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          
        ],
      ),
    );
  }
}
