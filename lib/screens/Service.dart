import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../templates/AppBarTemplate.dart';
import '../templates/DrawerTemplate.dart';
import '../templates/DrawerTemplateGeneral.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Service extends StatefulWidget {
  final name;
  Service(this.name);
  @override
  _ServiceState createState() => _ServiceState(this.name);
}

class _ServiceState extends State<Service> {
  final name;
  _ServiceState(this.name);


  List fields = ["name","gender","bd","bm","by","bh","bmi","bs","bp"];
  List fieldTitles = ["Name","Gender","Birth Date","Birth Month","Birth Year","Birth Hour","Birth Minute","Birth Second","Birth Place"];

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
        appBar: AppBarTemplate("Express Interest"),
        drawer: (firstName==null)?DrawerTemplateGeneral():DrawerTemplate(firstName,lastName,email),
        body: ServicePage(this.name),
      ),
    );
  }
}

class ServicePage extends StatefulWidget {
  final name;
  ServicePage(this.name);

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
List fields = ["name","gender","bd","bm","by","bh","bmi","bs","bp"];

List fieldTitles = ["Name","Gender","Birth Date","Birth Month","Birth Year","Birth Hour","Birth Minute","Birth Second","Birth Place"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          Text(this.widget.name, style: TextStyle(fontSize: 30.0)),
          SizedBox(
            height: 20.0,
          ),
          Text(
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rho"),
          SizedBox(
            height: 20.0,
          ),
          ListView.builder(
            physics: ScrollPhysics(),
            itemCount: fields.length,
            shrinkWrap: true,
            itemBuilder: (context,index){
            return Container(
              child: Column(
                children: [
                  SizedBox(
                  height: 20.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: fieldTitles[index],
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      )
                    ),
                  )
                ],
              ),
            );
          },),
          SizedBox(height: 20,),
          MaterialButton(
            height: 50.0,
            onPressed: (){},
            color: Colors.blue,
            child: Text("Send",style: TextStyle(color: Colors.white,fontSize: 16.0)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ],
      ),
    ));
  }
}
