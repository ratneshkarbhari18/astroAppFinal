import 'dart:convert';
import 'package:flutter/material.dart';
import '../templates/AppBarTemplate.dart';
import '../templates/DrawerTemplate.dart';
import '../templates/DrawerTemplateGeneral.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../utils/Constants.dart';
import 'package:intl/intl.dart';



class TodaysHoroscope extends StatefulWidget {
  @override
  _TodaysHoroscopeState createState() => _TodaysHoroscopeState();
}

class _TodaysHoroscopeState extends State<TodaysHoroscope> {
  _TodaysHoroscopeState();

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
        drawer: (firstName!=null)?DrawerTemplate(firstName, lastName, email):DrawerTemplateGeneral(),
        appBar: AppBarTemplate("Todays Horoscope"),
        body: TodaysHoroscopePage(),
      )
    );
  }
}

class TodaysHoroscopePage extends StatefulWidget {


  @override
  _TodaysHoroscopePageState createState() => _TodaysHoroscopePageState();
}

class _TodaysHoroscopePageState extends State<TodaysHoroscopePage> {

  var horoScopeData;
  var _error="";
  var horoscopeData;

  Future fetchTodaysHoroscope() async{
    DateTime todaysDate = DateTime.now();
    String todaysDateFormatted = DateFormat('dd-MM-yyyy').format(todaysDate);
    var url = Constants.apiUrl+'daily-horoscope-api';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({
      'api_key': '5f4dbf2e5629d8cc19e7d51874266678',
      'date': todaysDateFormatted
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonRes = await response.stream.bytesToString();
      setState(() {
        horoScopeData =  jsonDecode(jsonRes)["data"];
      });
    }
    else {
      print(response.reasonPhrase);
      setState(() {
        _error = response.reasonPhrase;
      });
    }
    
  }

  var allSigns = ["aries",
                    "taurus",
                    "gemini",
                    "cancer",
                    "leo",
                    "virgo",
                    "libra",
                    "scorpio",
                    "sagittarius",
                    "capricorn",
                    "aquarius",
                    "pisces"];

  void initState() {
    super.initState();
    fetchTodaysHoroscope();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text((jsonDecode(horoScopeData)["title"]).toUpperCase(),style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
              SizedBox(height:20.0),
              (horoScopeData==null)?CircularProgressIndicator():ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context,index){
              return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  Text(allSigns[index].toUpperCase()+": ",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  Text(jsonDecode(jsonDecode(horoScopeData)["horoscopes"])[allSigns[index]])                  
                ],
              );
            },itemCount: allSigns.length,)
            ],
          )
        ),
      ),
    );
  }
}
