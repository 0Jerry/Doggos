import 'package:flutter/material.dart';

class AddDogFormPage extends StatefulWidget {

  @override
  _AddDogFormPageState createState() {
    return _AddDogFormPageState();
  }

}

class _AddDogFormPageState extends State<AddDogFormPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new dog"),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: TextField(decoration: InputDecoration(labelText: "Name the Pup"),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: TextField(decoration: InputDecoration(labelText: "Pup's location"),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: TextField(decoration: InputDecoration(labelText: "All about the Pup"),),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Builder(builder: (context) {
                return RaisedButton(
                  onPressed: () => print("PRESSED"),
                  color: Colors.indigoAccent,
                  child: Text("Submit Pup"),
                );
              },),
            )
          ],
        )
      ),
    );
  }

}