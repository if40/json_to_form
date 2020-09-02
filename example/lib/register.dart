import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_to_form/json_schema.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _Register createState() => new _Register();
}

class _Register extends State<Register> {
  String form = json.encode({
    'autoValidated': false,
    'fields': [
      {
        'key': 'name',
        'type': 'Input',
        'label': 'Име',
        'placeholder': "Въведете Вашето име",
        'required': true,
      },
      {
        'key': 'username',
        'type': 'Input',
        'label': 'Потребителсо име',
        'placeholder': "Въведете Вашето потребителско име",
        'required': true,
        'hiddenLabel':true,
      },
      {'key': 'email', 'type': 'Email', 'label': 'Имейл', 'required': true},
      {
        'key': 'password1',
        'type': 'Password',
        'label': 'Парола',
        'required': true
      },
    ]
  });
  dynamic response;

  Map decorations = {
    'email': InputDecoration(
      hintText: 'Имейл',
      prefixIcon: Icon(Icons.email),
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    ),
    'username': InputDecoration(
      labelText: "Въведете Вашия имейл",
      prefixIcon: Icon(Icons.account_box),
      border: OutlineInputBorder(),
    ),
    'password1': InputDecoration(
        prefixIcon: Icon(Icons.security), border: OutlineInputBorder()),
  };

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text("Регистрация"),
        //backgroundColor: Colors.blue,
      ),
      body: new SingleChildScrollView(
        child: new Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: new Column(children: <Widget>[
            new Container(
              child: new Text(
                "Регистрационна форма",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.only(top:10.0),
            ),
            new JsonSchema(
              decorations: decorations,
              form: form,
              onChanged: (dynamic response) {
                this.response = response;
              },
              actionSave: (data) {
                print(data);
              },
              buttonSave: new Container(
                height: 40.0,
                color: Theme.of(context).accentColor,
                child: Center(
                  child: Text("Регистриране",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ]),
        ),
      )
    );
  }
}
