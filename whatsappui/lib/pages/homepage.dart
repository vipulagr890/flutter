import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsappui/pages/calls.dart';
import 'package:whatsappui/pages/camera.dart';
import 'package:whatsappui/pages/chats.dart';
import 'package:whatsappui/pages/status.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this, initialIndex: 1)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text('WhatsApp', style: GoogleFonts.roboto()),
        backgroundColor: const Color(0xff075e54),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              // handle the press
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 7),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'More Options',
            onPressed: () {
              // handle the press
            },
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: width / 13.75),
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(
              text: ("CHATS"),
            ),
            Tab(text: ("STATUS")),
            Tab(
              text: ("CALLS"),
            )
          ],
        ),
      ),
      floatingActionButton: _getFAB(),
      body: TabBarView(
        //this will work similar to fragment in android app
        controller: _tabController,
        //loading 4 pages in tabs
        children: const <Widget>[Camera(), Chats(), Status(), Calls()],
      ),
    );
  }

  _getFAB() {
    if (_tabController.index == 1) {
      return SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          elevation: 0.5,
          onPressed: () {
            // Add your onPressed code here!
          },
          child: const Icon(Icons.chat),
          backgroundColor: const Color(0xff075e54),
        ),
      );
    } else if (_tabController.index == 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            elevation: 0.5,
            onPressed: () {
              // Add your onPressed code here!
            },
            child: const Icon(Icons.edit),
            backgroundColor: Colors.black54,
          ),
          const Padding(padding: EdgeInsets.all(10)),
          FloatingActionButton(
            elevation: 0.5,
            onPressed: () {
              // Add your onPressed code here!
            },
            child: const Icon(Icons.camera_alt),
            backgroundColor: const Color(0xff075e54),
          ),
        ],
      );
    } else if (_tabController.index == 3) {
      return SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          elevation: 0.5,
          onPressed: () {
            // Add your onPressed code here!
          },
          child: const Icon(Icons.add_ic_call),
          backgroundColor: const Color(0xff075e54),
        ),
      );
    }
  }
}
