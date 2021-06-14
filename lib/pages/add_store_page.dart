import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddStorePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("Add Store")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) { },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter store name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: "Enter store name"),
                ),
                TextFormField(
                  onChanged: (value) { },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter store address";
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: "Enter store address"),
                ),
                RaisedButton(
                    child: Text("Save", style: TextStyle(color: Colors.white)),
                    onPressed: () {

                    },
                    color: Colors.blue),
                Spacer(),
                Text("")
              ],
            ),
          ),
        ));
  }
}
