import 'package:peintt/pages/Homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';

// ignore: camel_case_types
class Purchase_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                CupertinoIcons.chevron_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Homepage()));
              },
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Subscribe now:',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('monthly:', style: TextStyle(fontSize: 20)),
                      MaterialButton(
                        padding: EdgeInsets.fromLTRB(50, 13, 50, 13),
                        onPressed: () {
                          debugPrint('I am a material button');
                        },
                        shape: const StadiumBorder(),
                        textColor: Colors.black,
                        color: Colors.blue[300],
                        splashColor: Colors.blue[900],
                        child: Text(r"$ 6.99"),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Yearly:', style: TextStyle(fontSize: 20)),
                      Banner(
                        color: Colors.red,
                        message: ('Most Popular'),
                        location: BannerLocation.topEnd,
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(50, 13, 50, 13),
                          onPressed: () {
                            debugPrint('I am a material button');
                          },
                          shape: const StadiumBorder(),
                          textColor: Colors.black,
                          color: Colors.blue[300],
                          splashColor: Colors.blue[900],
                          child: Text(r"$ 79.99"),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
