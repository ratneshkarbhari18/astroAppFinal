import 'package:flutter/material.dart';
import 'utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/Home.dart';


Future main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Astro App",
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
    )
  );

}

