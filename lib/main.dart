import 'package:flutter/material.dart';
String url = 'http:codesfor.in';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1547665979-bb809517610d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80'),
              fit: BoxFit.cover),
        ),
        // child: Center(
        //   child: Text('Hello World',
        //     style: TextStyle(
        //     fontSize: 24,
        //     color: Colors.green,
        //     fontWeight: FontWeight.normal,
        //     fontStyle: FontStyle.italic,
        //     ),
        //   ),
        // ),
        child: Center(
          child: RaisedButton(
            color: Colors.redAccent,
            textColor: Colors.white,
            onPressed: () {
              navigateToSubPage(context);
            },
            child: Text("Go to Sub Page"),
          ),
        ),
      ),
    );
  }

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
  }
}

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Page'),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            color: Colors.redAccent,
            textColor: Colors.white,
            onPressed: () {
              showAlertDialog(context);
            },
            child: Text("Button"),
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert Title"),
    content: Text("This is an alert message."),
    actions: [
      okButton,
    ],
  );

  // Show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
