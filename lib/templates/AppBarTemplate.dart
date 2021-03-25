import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';



class AppBarTemplate extends StatelessWidget with PreferredSizeWidget {

  final title;
  AppBarTemplate(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBarContent(title);
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


class AppBarContent extends StatefulWidget {
  final title;
  AppBarContent(this.title);
  @override
  _AppBarContentState createState() => _AppBarContentState(title);
}

class _AppBarContentState extends State<AppBarContent> {
  
  final title;
  _AppBarContentState(this.title);

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

  var _url = "tel:9137976398";

  void _makingPhoneCall() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.title),
      actions: [
        IconButton(
          icon: Icon(Icons.call), 
          onPressed: _makingPhoneCall
        ),
        (firstName!=null)?IconButton(
          onPressed: ()async{},
          icon: Icon(Icons.logout),
        ):Text("")
      ],
    );
  }
}