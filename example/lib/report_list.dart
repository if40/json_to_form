import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'report_list_model.dart';

class ReportList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headline1),
        backgroundColor: Colors.white,
      ),
      body: Container(
        //color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: _ReportList(),
              ),
            ),
            Divider(height: 4, color: Colors.black),
            
          ],
        ),
      ),
    );
  }
}

class _ReportList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    var reports = context.watch<ReportListModel>();
  
    return ListView.builder(
      itemCount: reports.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        title: Text(
          reports.items[index].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}

