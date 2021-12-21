import 'package:flutter/material.dart';
import 'package:prac_1/basic.dart';
import 'package:prac_1/steps.dart';
import 'package:prac_1/tabbar.dart';

class BottomDrawer extends StatefulWidget {
  const BottomDrawer({Key? key}) : super(key: key);

  @override
  _BottomDrawerState createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer> {
  var currentpage = 0;

  var index = const [
    Basic(title: "page_1"),
    Tabs(title: "page_2"),
    Steps(title: "page_3")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: index.elementAt(currentpage),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.announcement), label: ("Announcements")),
            BottomNavigationBarItem(
                icon: Icon(Icons.cake), label: ("Birthdays")),
            BottomNavigationBarItem(icon: Icon(Icons.cloud), label: ("Data")),
          ],
          currentIndex: currentpage,
          fixedColor: Colors.red,
          onTap: (int inindex) {
            setState(() {
              currentpage = inindex;
            });
          },
        ));
  }
}
