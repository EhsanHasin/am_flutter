import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
      title: "e7 App",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final String FIRST_NAME = "fisrt_name";
final String LAST_NAME = "last_name";
final String AGE = "age";

class _HomePageState extends State<HomePage> {

  late SharedPreferences preferences;

  var firstName, lastName, age;
  var data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Share Preferences",
                style: TextStyle(fontSize: 30),
              ),
              TextField(
                decoration: InputDecoration(hintText: "First Name"),
                onChanged: (fn) {
                  firstName = fn;
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: "Last Name"),
                onChanged: (ln) {
                  lastName = ln;
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: "age"),
                onChanged: (age) {
                  this.age = age;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: () async{

                  preferences = await SharedPreferences.getInstance();
                  await preferences.setString(FIRST_NAME, firstName);
                  await preferences.setString(LAST_NAME, lastName);
                  await preferences.setString(AGE, age);

                }, child: Text("Save")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: () async{
                  preferences = await SharedPreferences.getInstance();
                  firstName = await preferences.getString(FIRST_NAME) ?? "no name";
                  lastName = await preferences.getString(LAST_NAME) ?? "no last name";
                  age = await preferences.getString(AGE) ?? "no age";
                  data = "you are $firstName $lastName and your age is $age years old";
                  setState(() {});
                }, child: Text("Restore")),
              ),
              Text(
                "Data = $data",
                style: TextStyle(fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){

                }, child: Text("Delete")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
