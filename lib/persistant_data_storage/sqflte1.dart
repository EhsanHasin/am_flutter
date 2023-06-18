import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: "e7 App",
    theme: ThemeData(primarySwatch: Colors.blue),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Database database;
  var id, name, age;
  var tecId = TextEditingController();
  var tecName = TextEditingController();
  var tecAge = TextEditingController();
  List<Dog> allDogs = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    openDB();
  }

  openDB() async {
    database = await openDatabase(
      join(await getDatabasesPath(), "dog_database.db"),
      onCreate: (db, version) {
        db.execute("CREATE TABLE dogs(id INT PRIMARY KEY, name TEXT, age INT)");
      },
      version: 1,
    );
  }

  Future<void> insertDog(Dog dog) async {
    int result = await database.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    if (result != 0) {
      Fluttertoast.showToast(
          msg: "Inserted dog with id = $result",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      throw Exception("Problem in Insertion the Dog in database");
    }
  }

  Future<List<Dog>> getAllDogs() async {
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await database.query('dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  Future<Dog> getDogById(int id) async {
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await database.query('dogs', where: "id = ?", whereArgs: [id]);

    if(maps.isEmpty)
      return Dog(id: 0, name: "Null", age: 0);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return Dog(
      id: maps[0]['id'],
      name: maps[0]['name'],
      age: maps[0]['age'],
    );
  }

  Future<void> deleteDogById(int id) async {
    int count = await database.delete("dogs", where: "id = ?", whereArgs: [id]);
    if (count != 0) {
      Fluttertoast.showToast(
          msg: "dog with id = $id deleted.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      throw Exception("Problem in Deletion the Dog in database");
    }
  }

  Future<void> deleteDogs() async {
    int count = await database.delete("dogs");
    if (count != 0) {
      Fluttertoast.showToast(
          msg: "All dogs deleted.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      throw Exception("Problem in Deletion the Dogs in database");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "SQLite Database",
                style: TextStyle(fontSize: 30),
              ),
              TextField(
                controller: tecId,
                decoration: InputDecoration(hintText: "Enter id", label: Text("Id")),
                onChanged: (id) {
                  this.id = id;
                },
              ),
              TextField(
                controller: tecName,
                decoration: InputDecoration(hintText: "Enter name", label: Text("Name")),
                onChanged: (name) {
                  this.name = name;
                },
              ),
              TextField(
                controller: tecAge,
                decoration: InputDecoration(hintText: "Enter your age", label: Text("Age")),
                onChanged: (age) {
                  this.age = age;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          var dog = Dog(
                              id: int.parse(id),
                              name: name,
                              age: int.parse(age));
                          await insertDog(dog);
                          emptyFormFields();
                        },
                        child: Text("Save dog")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          allDogs = await getAllDogs();
                          setState(() {});
                        },
                        child: Text("List All Dogs")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          if(tecId.text.isEmpty){
                            Fluttertoast.showToast(
                                msg: "Enter id to delete",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM_LEFT,
                                backgroundColor: Colors.yellow,
                                textColor: Colors.black,
                                fontSize: 16.0);
                            return;
                          }
                          deleteDogById(int.parse(id));
                          setState(() {});
                        },
                        child: Text("Delete by Id")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          await deleteDogs();
                          setState(() {});
                        },
                        child: Text("Delete All")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          if(tecId.text.isEmpty){
                            Fluttertoast.showToast(
                                msg: "Enter id to search",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM_LEFT,
                                backgroundColor: Colors.yellow,
                                textColor: Colors.black,
                                fontSize: 16.0);
                            return;
                          }
                          Dog dog = await getDogById(int.parse(id));
                          allDogs.clear();
                          allDogs.add(dog);
                          setState(() {});
                        },
                        child: Text("Search by id")),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: allDogs.length,
                    itemBuilder: (c, i) {
                      var tempDog = allDogs[i];
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.lightBlueAccent,
                          child: Text(tempDog.id.toString()),
                        ),
                        title: Text(
                          tempDog.name,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          tempDog.age.toString(),
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void emptyFormFields() {
    setState(() {
      tecId.clear();
      tecName.clear();
      tecAge.clear();
    });
  }
}

class Dog {
  final int id;
  final String name;
  final int age;
  Dog({required this.id, required this.name, required this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return "Dog{id: $id, name: $name, age: $age}";
  }
}
