import 'package:flutter/material.dart';
// import '../templates/AppBarTemplate.dart';
// import '../templates/DrawerTemplate.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  _AboutState();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DrawerTemplate(),
      // appBar: AppBarTemplate(this.name),
      body: AboutPage(),
    );
  }
}

class AboutPage extends StatefulWidget {


  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

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
