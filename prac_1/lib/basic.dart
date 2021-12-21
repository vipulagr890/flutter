import "package:flutter/material.dart";

class Basic extends StatelessWidget {
  const Basic({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    _showit() {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text("we come in peace"),
              content: Center(
                child: Text("shoot to kill"),
              ),
            );
          });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: Drawer(
            child: SafeArea(
          child: Column(
            children: const [
              Text("child_1"),
              Divider(),
              Text("child_2"),
              Divider(),
              Text("child_3")
            ],
          ),
        )),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //using row with divider which will not work because divider only works with hor. component
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("child_1"),
                      Divider(),
                      Text("child_2"),
                      Divider(),
                      Text("child_3")
                    ],
                  ),

                  //using column instead of row
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("child_1"),
                      Divider(),
                      Text("child_2"),
                      Divider(),
                      Text("child_3")
                    ],
                  ),

                  //using card instead of only column
                  Card(
                    child: Column(
                      children: const [
                        Text("child_1"),
                        Divider(),
                        Text("child_2"),
                        Divider(),
                        Text("child_3")
                      ],
                    ),
                  ),
                  Tooltip(
                      message: "Check me out!",
                      child: ElevatedButton(
                          child: const Text("Check me out!"),
                          onPressed: _showit)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
