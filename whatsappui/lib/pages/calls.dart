import 'package:flutter/material.dart';
import 'package:whatsappui/datamodel/call_model.dart';

class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: callData.length,
        itemBuilder: (context, i) {
          return Column(children: [
           
            ListTile(
              leading: InkWell(
                onTap: (){},
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage:
                      AssetImage(callData[i].avatar ?? "images/no_image.jpg"),
                ),
              ),
              title: Text(callData[i].name),
              subtitle: Text(callData[i].date + ", " + callData[i].time),
              trailing: _gettrailing(callData[i].audiocall),
              onTap: (){},
            ),
             const Divider(height: 10.0),
          ]);
        });
  }

  _gettrailing(callData) {
    if (callData == true) {
      return const Icon(Icons.call,
      color: Colors.green,);
    } else {
      return const Icon(Icons.video_call, color: Colors.green,);
    }
  }
}
