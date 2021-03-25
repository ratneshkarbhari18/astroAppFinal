import 'package:astro_app/templates/AppBarTemplate.dart';
import 'package:astro_app/templates/DrawerTemplate.dart';
import 'package:astro_app/templates/DrawerTemplateGeneral.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  var firstName;
  var lastName;
  var email;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _setUserState() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      firstName = prefs.getString("first_name");
      lastName = prefs.getString("last_name");
      email = prefs.getString("email");
    });
  }

  @override
  void initState() {
    super.initState();
    _setUserState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarTemplate("Contact"),
        drawer: (firstName==null)?DrawerTemplateGeneral():DrawerTemplate(firstName, lastName, email),
        body: ContactPage(),
      ),      
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
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
          children: [
            SizedBox(height: 10.0),
            Text("Mobile Number: ",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
            Text("+91 9137976398",style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 10.0),
            Text("Email: ",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
            Text("ratneshkarbhari74@gmail.com",style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 10.0),
            Text("Address: ",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
            Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",style: TextStyle(fontSize: 15.0)),
            Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",style: TextStyle(fontSize: 15.0)),
          ],
        ),
      ),      
    );
  }
}