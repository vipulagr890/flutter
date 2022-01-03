import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formkey = GlobalKey<FormState>();
  String _title = "";
  late String priority;
  DateTime _date = DateTime.now();

  final TextEditingController _datecontroller = TextEditingController();

  final DateFormat _dateformatter = DateFormat('MM dd, yyyy');

  @override
  void initState() {
    super.initState();
    _datecontroller.text = _dateformatter.format(_date);
  }

  @override
  void dispose() {
    _datecontroller.dispose();
    super.dispose();
  }

  _handleDatePicker() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (date != null && date != _date) {
      _date = date;
    }
    _datecontroller.text = _dateformatter.format(_date);
  }

  final List<String> _priorities = ["Low", "Medium", "High"];

  _submit() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      // Insert the task to user database 

      // Update the task
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).primaryColor,
                    size: 30.0,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Add Task",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: TextFormField(
                            style: const TextStyle(fontSize: 18.0),
                            decoration: const InputDecoration(
                              labelText: "title",
                              labelStyle: TextStyle(fontSize: 18.0),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                            ),
                            validator: (value) => value!.trim().isEmpty
                                ? "Please Enter a task title"
                                : null,
                            onSaved: (input) => _title = input!,
                            initialValue: _title,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: TextFormField(
                            controller: _datecontroller,
                            onTap: _handleDatePicker,
                            style: const TextStyle(fontSize: 18.0),
                            decoration: const InputDecoration(
                              labelText: "Date",
                              labelStyle: TextStyle(fontSize: 18.0),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: DropdownButtonFormField(
                            isDense: true,
                            items: _priorities.map((String priority) {
                              return DropdownMenuItem(
                                  value: priority,
                                  child: Text(
                                    priority,
                                    style: const TextStyle(
                                        fontSize: 18.0, color: Colors.black),
                                  ));
                            }).toList(),
                            style: const TextStyle(fontSize: 18.0),
                            decoration: const InputDecoration(
                              labelText: "priority",
                              labelStyle: TextStyle(fontSize: 18.0),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                            ),
                            validator: (value) => priority == "priority" ? "please select a priority" : null,
                            onChanged: (value) {
                              setState(() {
                                priority = value.toString();
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          height: 60.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: TextButton(
                              onPressed: _submit,
                              child: const Text(
                                "ADD",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20.0),
                              )),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
