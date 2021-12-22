import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:peintt/services/setting.dart';
import 'package:peintt/blocs/image_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:peintt/services/purchase_screen.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elysian', style: TextStyle(color: Colors.white)),
        elevation: 0.0,
        backgroundColor: Colors.black,
        actions: <Widget>[
          RawMaterialButton(
            constraints: BoxConstraints.expand(width: 80, height: 5),
            elevation: 2.0,
            child: Text('Go Pro',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            padding: EdgeInsets.fromLTRB(-20, 0, 0, 0),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Purchase_screen()));
            },
          ),
          RawMaterialButton(
            constraints: BoxConstraints.expand(width: 80, height: 5),
            elevation: 2.0,
            child: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            padding: EdgeInsets.fromLTRB(-20, 0, 0, 0),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Settings()));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: new Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Color(0xFFB4C56C), BlendMode.darken),
                  image: ExactAssetImage('assets/cards_images/bg_image.png'),
                  fit: BoxFit.cover)),
          alignment: Alignment.center,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                padding: EdgeInsets.all(90),
                child: Text('Pick Image'),
                onPressed: () {
                  context.read<ImageBloc>().add(ImageEvent.loadImage());
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90.0),
                    side: BorderSide(color: Colors.blue, width: 5.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
