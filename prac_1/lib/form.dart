import 'package:flutter/material.dart';

class Formes extends StatefulWidget {
  const Formes({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _FormesState createState() => _FormesState();
}

class LoginData {
  String username = "";
  String password = "";
}

class _FormesState extends State<Formes> {
  final LoginData _loginData = LoginData();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _checkboxValue = false;
  var _switchValue = false;
  var _sliderValue = .3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(50.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (inValue) {
                        if (inValue!.isEmpty) {
                          return "Please enter username";
                        }
                        return null;
                      },
                      onSaved: (inValue) {
                        _loginData.username = inValue!;
                      },
                      decoration: const InputDecoration(
                          hintText: "none@none.com",
                          labelText: "Username (eMail address)")),
                  TextFormField(
                      obscureText: true,
                      validator: (inValue) {
                        if (inValue!.length < 10) {
                          return "Password must be >=10 in length";
                        }
                        return null;
                      },
                      onSaved: (inValue) {
                        _loginData.password = inValue!;
                      },
                      decoration: const InputDecoration(
                          hintText: "Password", labelText: "Password")),
                  Checkbox(
                      value: _checkboxValue,
                      onChanged: (inValue) {
                        setState(() {
                          _checkboxValue = inValue!;
                        });
                      }),
                  Switch(
                      value: _switchValue,
                      onChanged: (inValue) {
                        setState(() {
                          _switchValue = inValue;
                        });
                      }),
                  Slider(
                      min: 0,
                      max: 20,
                      value: _sliderValue,
                      onChanged: (inValue) {
                        setState(() => _sliderValue = inValue);
                      }),
                  ElevatedButton(
                      child: const Text("Log In"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // ignore: avoid_print
                          print("Username: ${_loginData.username}");
                          // ignore: avoid_print
                          print("Password: ${_loginData.password}");
                        }
                      })
                ],
              )),
        ),
      ),
    );
  }
}
