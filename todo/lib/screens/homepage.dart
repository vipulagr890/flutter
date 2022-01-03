import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/add_task.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildtask(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          ListTile(
            title: const Text("Task Title"),
            subtitle: const Text("oct 2nd,2021 - High"),
            trailing: Checkbox(
              onChanged: (value) {
                if (kDebugMode) {
                  print("value");
                }
              },
              value: true,
              activeColor: Theme.of(context).primaryColor,
            ),
          ),
          const Divider(thickness: 2.0)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddTask())),
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("My Task",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("1 of 10",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0))
                    ],
                  ),
                );
              }
              return _buildtask(index);
            }));
  }
}
