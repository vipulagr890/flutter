import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class First_time_screen extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final Widget loading_screen;

  final PageRoute introscreen;

  final PageRoute landingscreen;

  First_time_screen(
      {Key key,
      // ignore: non_constant_identifier_names
      this.loading_screen,
      @required this.introscreen,
      @required this.landingscreen})
      : super(key: key);

  _First_time_screenState createState() => _First_time_screenState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<Widget>('loading_screen', loading_screen));
  }
}

// ignore: camel_case_types
class _First_time_screenState extends State<First_time_screen> {
  Future _checkfirstscreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('IntroScreen_seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(widget.landingscreen);
    } else {
      prefs.setBool('IntroScreen_seen', true);
      Navigator.of(context).pushReplacement(widget.introscreen);
    }
  }

  @override
  void initState() {
    super.initState();

    new Timer(new Duration(milliseconds: 1), () {
      _checkfirstscreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.loading_screen;
  }
}
