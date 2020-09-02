import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_to_form/json_schema.dart';

class AllFields extends StatefulWidget {
  AllFields({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _AllFields createState() => new _AllFields();
}

class _AllFields extends State<AllFields> {
  String form = json.encode({
    'title': 'Тестова форма',
    'description':
        'Тази форма и контролите в нея са само за тест и примерна визуализация.',
    'autoValidated': true,
    'fields': [
      {
        'key': 'input1',
        'type': 'Input',
        'label': 'Наименование',
        'placeholder': "Примерно наименование",
        'value': '',
        'required': true
      },
      {
        'key': 'password1',
        'type': 'Password',
        'label': 'Парола',
        'required': true
      },
      {
        'key': 'email1',
        'type': 'Email',
        'label': 'Email',
        'placeholder': "test@example.com"
      },
      {
        'key': 'radiobutton1',
        'type': 'RadioButton',
        'label': 'Радио бутони',
        'value': 2,
        'items': [
          {
            'label': "Опция 1",
            'value': 1,
          },
          {
            'label': "Опция 2",
            'value': 2,
          },
          {
            'label': "Опция 3",
            'value': 3,
          }
        ]
      },
      {
        'key': 'switch1',
        'type': 'Switch',
        'label': 'Тест на превключвател',
        'value': false,
      },
      {
        'key': 'checkbox1',
        'type': 'Checkbox',
        'label': 'Тест на отметки',
        'items': [
          {
            'label': "Опция 1",
            'value': true,
          },
          {
            'label': "Опция 2",
            'value': false,
          },
          {
            'label': "Опция 3",
            'value': false,
          }
        ]
      },
      {
        'key': 'select1',
        'type': 'Select',
        'label': 'Тест на комбо',
        'value': 'Опция 1',
        'items': [
          {
            'label': "Опция 1",
            'value': "Опция 1",
          },
          {
            'label': "Опция 2",
            'value': "Опция 2",
          },
          {
            'label': "Опция 3",
            'value': "Опция 3",
          }
        ]
      },
    ]
  });
  dynamic response;

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
        title: new Text("Преобразуване на Json във формуляр."),
        //backgroundColor: Colors.blue,
      ),
      body: new SingleChildScrollView(
        child: new Container(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: new Column(children: <Widget>[
            new JsonSchema(
              form: form,
              onChanged: (dynamic response) {
                this.response = response;
                print(response);
              },
              actionSave: (data) {
                print(data);
              },
              buttonSave: new Container(
                height: 40.0,
                color: Theme.of(context).accentColor,
                child: Center(
                  child: Text("Изпращане",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
