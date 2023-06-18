import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

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

final String NOTE_TABLE_NAME = "notes";
final String NOTE_ID = "not_id";
final String NOTE_TITLE = "not_title";
final String NOTE_DESCRIPTION = "not_description";


class _HomePageState extends State<HomePage> {
  var factory = databaseFactoryFfiWeb;
  late Database database;
  var noteId, noteTitle, noteDescription;
  var tecId = TextEditingController();
  var tecTitle = TextEditingController();
  var tecDescription = TextEditingController();
  List<Note> notes = List.empty(growable: true);

  @override
  void initState(){
    super.initState();

    openDB();

  }

  openDB() async{
    // Init ffi loader if needed.
    sqfliteFfiInit();

    var databaseFactory = databaseFactoryFfiWeb;
    var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
    await db.execute('''
  CREATE TABLE Product (
      id INTEGER PRIMARY KEY,
      title TEXT
  )
  ''');
    await db.insert('Product', <String, Object?>{'title': 'Product 1'});
    await db.insert('Product', <String, Object?>{'title': 'Product 1'});

    var result = await db.query('Product');
    print(result);
    // prints [{id: 1, title: Product 1}, {id: 2, title: Product 1}]
    await db.close();

    // database = await factory.openDatabase(
    //     join(await getDatabasesPath(), "notesDB.db"),
      //   onCreate: (db,ver){
      //     db.execute('''CREATE TABLE $NOTE_TABLE_NAME(
      //         $NOTE_ID INT primary key,
      //         $NOTE_TITLE TEXT,
      //         $NOTE_DESCRIPTION TEXT
      //     )'''
      //     );
      // },
      //   version: 1,
    // );
  }

  Future<void> insertNote(Note note)async{
    await database.insert(
        "notes",
        note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<Note>> getNotes()async{
    List<Map<String,dynamic>> maps = await database.query("notes");
    return List.generate(
        maps.length, (i) =>
        Note(
            id: maps[i][NOTE_ID],
            title: maps[i][NOTE_TITLE],
            description: maps[i][NOTE_DESCRIPTION]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DB App"),
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
                decoration: InputDecoration(hintText: "Enter Note id", label: Text("Id")),
                onChanged: (id) {
                  this.noteId = id;
                },
              ),
              TextField(
                controller: tecTitle,
                decoration: InputDecoration(hintText: "Enter Note title", label: Text("Title")),
                onChanged: (title) {
                  this.noteTitle = title;
                },
              ),
              TextField(
                controller: tecDescription,
                decoration: InputDecoration(hintText: "Enter Note Description", label: Text("Description")),
                onChanged: (desc) {
                  this.noteDescription = desc;
                },
              ),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: (){
                          var tempNote = Note(id: int.parse(noteId), title: noteTitle, description: noteDescription);
                          insertNote(tempNote);
                          // Fluttertoast.showToast(msg: "Inserted :)", backgroundColor: Colors.greenAccent);
                        },
                        child: Text("Save Note")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: ()async{
                          notes.clear();
                          notes = await getNotes();
                          setState(() {

                          });
                        },
                        child: Text("List All Notes")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: (){
                        },
                        child: Text("Delete by Id")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: (){

                        },
                        child: Text("Delete All")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: (){
                        },
                        child: Text("Search by id")),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (c, i) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.lightBlueAccent,
                          child: Text(notes[i].id.toString()),
                        ),
                        title: Text(
                          notes[i].title,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          notes[i].description,
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

  @override
  void dispose() {
    super.dispose();
  }

}

class Note{
  final int id;
  final String title;
  final String description;

  Note({required this.id, required this.title, required this.description});

  Map<String, dynamic> toMap(){
    return {
      "not_id": id,
      "not_title": title,
      "not_description": description
    };
  }

}