import 'package:flutter/material.dart';
import 'package:myapp/dog_list.dart';
import 'package:myapp/new_dog_form.dart';

import 'dog_model.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We Rate Dogs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'We Rate Dogs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Dog> initialDoggos = []
    ..add(Dog("Ruby", "Portland, OR,USA", "Ruby is a very good girl."))
    ..add(Dog("Rex", "WA, USA", "Best in show 1999"))
    ..add(Dog("Rod Stewart", "Prague, CZ", "Star good boy on international snooze team."))
    ..add(Dog("Herbert", "TX, USA", "A Very Good Boy"))
    ..add(Dog("Buddy", "North Pole, Earth", "Self proclaimed human lover."));


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showNewDogForm,
          )
        ],
      ),
      body: new Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[400],
              Colors.indigo[200],
            ],
          )
        ),
        child: DogList(initialDoggos),
      ),
    );
  }

  Future _showNewDogForm() async {
    Dog newDog = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return AddDogFormPage();
      })
    );

    if (newDog != null) {
      initialDoggos.add(newDog);
    }
  }


}
