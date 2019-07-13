import 'package:flutter/material.dart';

import 'dog_model.dart';

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
              child: TextField(
                decoration: InputDecoration(labelText: "Name the Pup"),
                onChanged: (v) => nameController.text = v,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: TextField(
                decoration: InputDecoration(labelText: "Pup's location"),
                onChanged: (v) => locationController.text = v,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: TextField(
                decoration: InputDecoration(labelText: "All about the Pup"),
                onChanged: (v) => descriptController.text = v,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Builder(builder: (context) {
                return RaisedButton(
                  onPressed: () => submitPup(context),
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

  void submitPup(BuildContext context) {
    if (nameController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('Pop needs name!'),
        ),
      );
    } else {
      Dog dog = Dog(nameController.text, locationController.text, descriptController.text);
      Navigator.of(context).pop(dog);
    }
  }

}