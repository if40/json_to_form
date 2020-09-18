import 'dart:convert';

import 'package:flutter/material.dart';

import 'all_fields.dart';
import 'all_fields_v1.dart';
import 'login.dart';
import 'register.dart';
import 'report_model.dart';
// import 'report_list_model.dart';
// import 'package:provider/provider.dart';


//import 'register_with_map.dart';
//import 'all_fields_v1.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => MyHomePage(),
        '/allfieldsv1': (context) => AllFieldsV1(),
        '/allfields': (context) => AllFields(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        //'/registerMap': (context) => RegisterMap(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic response;
  int _generatedReportsindex = 0;
  int _selectedBottomBarIndex = 1;
  List<ReportModel> _reports = new List<ReportModel>();

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
        title: new Text("FGen test - Web Atlas ERP"),
        //backgroundColor: Colors.blue,
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        //child: new Column(children: <Widget>[]),
        child: new ListView.separated(
          itemCount: _reports.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.info_rounded),
              title: Text(_reports[index].name),
              subtitle: Text("Описание на ${_reports[index].name}",
                  style: TextStyle(fontStyle: FontStyle.italic)),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 1.0,
            );
          },
        ),
      ),
      drawer: Container(
        width: 200,
        child: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: AssetImage('images/logo.png'),
                        fit: BoxFit.contain)),
              ),
              ListTile(
                title: Text('Документи'),
                leading: Icon(Icons.notes),
                onTap: () {
                  Navigator.pushNamed(context, "/allfields");
                },
              ),
              ListTile(
                title: Text('Параметри'),
                leading: Icon(Icons.playlist_add_check),
                onTap: () {
                  Navigator.pushNamed(context, "/allfields");
                },
              ),
              ListTile(
                title: Text('Потребител'),
                leading: Icon(Icons.person),
                onTap: () {
                  Navigator.pushNamed(context, "/register");
                },
              ),
              ListTile(
                title: Text('Настройки'),
                leading: Icon(Icons.settings),
                onTap: () {
                  Navigator.pushNamed(context, "/allfields");
                },
              ),
              ListTile(
                title: Text('Относно'),
                leading: Icon(Icons.info_outline),
                onTap: () {
                  Navigator.pushNamed(context, "/allfields");
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Нова справка'),
        icon: Icon(Icons.add),
        //backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        tooltip: 'Добавяне на нова справка',
        onPressed: () => {_onBottomNavigationBarTapped(context)},
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          //canvasColor: Colors.green,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Theme.of(context).accentColor,
          // textTheme: Theme.of(context).textTheme.copyWith(
          //     caption: new TextStyle(color: Colors.yellow))
        ),
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedBottomBarIndex,
          onTap: _onBottomBarItemTapped,
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Начало"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.info),
              title: new Text("Справки"),
            )
          ],
        ),
      ),
    );
  }

  void _onBottomBarItemTapped(int index) {
    setState(() {
      _selectedBottomBarIndex = index;
    });
  }

  void _onBottomNavigationBarTapped(BuildContext context) {
    try {
      _generatedReportsindex++;
      setState(() {
        //Navigator.pushNamed(context, "/allfields");
        _reports.add(new ReportModel(
            name: "Справка " + _generatedReportsindex.toString(),
            id: _generatedReportsindex.toString()));
      });
      
      // var list = context.read<ReportListModel>();
      // list.add(new ReportModel(
      //       name: "Справка " + _generatedReportsindex.toString(),
      //       id: _generatedReportsindex.toString()));
    } catch (e) {
      print(e);
    }
  }
}
