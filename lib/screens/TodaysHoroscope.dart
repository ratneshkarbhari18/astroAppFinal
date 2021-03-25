import 'package:flutter/material.dart';
// import '../templates/AppBarTemplate.dart';
// import '../templates/DrawerTemplate.dart';

class TodaysHoroscope extends StatefulWidget {
  @override
  _TodaysHoroscopeState createState() => _TodaysHoroscopeState();
}

class _TodaysHoroscopeState extends State<TodaysHoroscope> {
  _TodaysHoroscopeState();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DrawerTemplate(),
      // appBar: AppBarTemplate(this.name),
      body: TodaysHoroscopePage(),
    );
  }
}

class TodaysHoroscopePage extends StatefulWidget {


  @override
  _TodaysHoroscopePageState createState() => _TodaysHoroscopePageState();
}

class _TodaysHoroscopePageState extends State<TodaysHoroscopePage> {

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
