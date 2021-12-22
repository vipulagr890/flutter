import 'package:peintt/pages/Homepage.dart';
import 'purchase_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isswitched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Settings",
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
          elevation: 2.0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_sharp),
                color: Colors.black,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Homepage()));
                },
              );
            },
          ),
        ),
        body: SafeArea(
          child: SettingsList(
            contentPadding: EdgeInsets.fromLTRB(4.0, 12.0, 8.0, 8.0),
            sections: [
              SettingsSection(
                  title: ' Premium Subscription',
                  titleTextStyle:
                      TextStyle(fontSize: 16, color: Colors.black38),
                  subtitlePadding: EdgeInsets.all(16.0),
                  tiles: [
                    SettingsTile(
                      title: 'Subscribe Now',
                      titleTextStyle:
                          TextStyle(fontSize: 20, color: Colors.blue),
                      subtitle: '100+ Image Filter Without Ads',
                      onPressed: (BuildContext context) {},
                    ),
                  ]),
              SettingsSection(
                  title: 'General',
                  titleTextStyle:
                      TextStyle(fontSize: 16, color: Colors.black38),
                  tiles: [
                    SettingsTile(
                        title: 'Rate the app',
                        onPressed: (BuildContext context) {
                          launch('https://flutter.dev');
                        }),
                    SettingsTile(
                        title: 'Share with friends',
                        onPressed: (BuildContext context) {}),
                    SettingsTile(
                        title: 'Visit Our Website',
                        onPressed: (BuildContext context) {}),
                    SettingsTile(
                        title: 'Feedback',
                        onPressed: (BuildContext context) {}),
                    SettingsTile(
                        title: 'Privacy Policy',
                        onPressed: (BuildContext context) {}),
                    SettingsTile(
                        title: 'Terms & Conditions',
                        onPressed: (BuildContext context) {}),
                  ]),
              SettingsSection(
                title: 'Notification',
                titleTextStyle: TextStyle(fontSize: 16, color: Colors.black38),
                tiles: [
                  SettingsTile.switchTile(
                    title: 'Daily Style',
                    leading: Icon(Icons.style),
                    switchValue: isswitched,
                    onToggle: (bool value) {
                      setState(() {
                        isswitched = value;
                      });
                    },
                  ),
                ],
              ),
              SettingsSection(
                tiles: [
                  SettingsTile(
                    title: 'Version',
                    subtitle: '1.0.1 @ 2021 Peintt, Inc.',
                  ),
                ],
              )
            ],
          ),
        ));
  }

  dynamic _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
