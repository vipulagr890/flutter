import 'package:flutter/material.dart';
import 'package:prac_1/form.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
                bottom: const TabBar(tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ]),
              ),
              body: const SafeArea(
                  child: TabBarView(children: [
                Formes(title: "LogIn Form"),
                Center(child: Text("Birthdays")),
                Center(child: Text("Data"))
              ])),
            )));
  }
}
