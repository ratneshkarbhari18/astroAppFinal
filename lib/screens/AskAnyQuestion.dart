import 'package:flutter/material.dart';
// import '../templates/AppBarTemplate.dart';
// import '../templates/DrawerTemplate.dart';

class AskAnyQuestion extends StatefulWidget {
  @override
  _AskAnyQuestionState createState() => _AskAnyQuestionState();
}

class _AskAnyQuestionState extends State<AskAnyQuestion> {
  _AskAnyQuestionState();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DrawerTemplate(),
      // appBar: AppBarTemplate(this.name),
      body: AskAnyQuestionPage(),
    );
  }
}

class AskAnyQuestionPage extends StatefulWidget {


  @override
  _AskAnyQuestionPageState createState() => _AskAnyQuestionPageState();
}

class _AskAnyQuestionPageState extends State<AskAnyQuestionPage> {

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
