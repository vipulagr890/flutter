import 'package:flutter/material.dart';

class Steps extends StatefulWidget {
  const Steps({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _StepsState createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  var _currentstep = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: SafeArea(
              child: Center(
                  child: Stepper(
            type: StepperType.vertical,
            currentStep: _currentstep,
            onStepContinue: _currentstep < 2
                ? () => setState(() => _currentstep += 1)
                : null,
            onStepCancel: _currentstep > 0
                ? () => setState(() => _currentstep -= 1)
                : null,
            steps: const [
              Step(
                  title: Text("Get Ready"),
                  isActive: true,
                  content: Text("Let's begin...")),
              Step(
                  title: Text("Get Set"),
                  isActive: true,
                  content: Text("Ok, just a little more...")),
              Step(
                  title: Text("Go!"),
                  isActive: true,
                  content: Text("And, we're done!"))
            ],
          )))),
    );
  }
}
