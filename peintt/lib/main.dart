import 'package:peintt/blocs/image_bloc.dart';
import 'package:peintt/pages/Homepage.dart';
import 'package:peintt/pages/Style_transfer.dart';
import 'package:peintt/services/image_facade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peintt/services/Intro_screen.dart';
import 'package:peintt/services/Splash_screen.dart';
import 'package:peintt/pages/style_transfer_page.dart';

void main() {
  runApp(BlocProvider(
      create: (context) =>
          ImageBloc(ImageFacade())..add(ImageEvent.loadModel()),
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Elysian',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(appBarTheme: AppBarTheme(elevation: 0.0)),
        home: BlocBuilder<ImageBloc, ImageState>(
          builder: (context, state) {
            return First_time_screen(
                loading_screen: Container(
                  color: Colors.black,
                ),
                introscreen:
                    MaterialPageRoute(builder: (context) => Intro_screen()),
                landingscreen: MaterialPageRoute(builder: (context) => page()));
          },
        ));
  }
}

// ignore: camel_case_types
class page extends StatefulWidget {
  @override
  _pageState createState() => _pageState();
}

// ignore: camel_case_types
class _pageState extends State<page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        if (state.modelLoaded == false) {
          return Container(
            color: Colors.black,
            child: Text(
              "Loading Model...",
              style: TextStyle(color: Colors.black),
            ),
          );
        } else {
          if (state.originImage == null) {
            return Homepage();
          } else {
            return TransferPage();
          }
        }
      },
    ));
  }
}
