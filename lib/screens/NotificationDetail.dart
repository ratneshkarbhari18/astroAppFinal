import 'package:astro_app/templates/AppBarTemplate.dart';
import 'package:astro_app/templates/DrawerTemplate.dart';
import 'package:astro_app/templates/DrawerTemplateGeneral.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

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
        appBar: AppBarTemplate("Notifications"),
        drawer: (firstName==null)?DrawerTemplateGeneral():DrawerTemplate(firstName, lastName, email),
        body: NotificationsPage(),
      ),      
    );
  }
}

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

  
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