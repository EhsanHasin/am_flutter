import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(
    MaterialApp(
      title: "e7 App",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
);
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var tec = TextEditingController();
  var myData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("e7 App"),),
      body: Column(
        children: [
          TextField(
            controller: tec,
            decoration: InputDecoration(hintText: "Enter your value"),
          ),
          ElevatedButton(onPressed: () async{
            //getting the file path
            var directory = await getApplicationDocumentsDirectory();

            //accessing the file
            File file = File("${directory.path}/myFile.txt");

            //writing to file
            await file.writeAsString(tec.text + ",", mode: FileMode.append);

          }, child: Text("Save")),
          ElevatedButton(onPressed: ()async{
            //getting the file path
            var directory = await getApplicationDocumentsDirectory();

            //accessing the file
            File file = File("${directory.path}/myFile.txt");

            //reading from file
            var temp = await file.readAsString();
            var temp2 = temp.substring(0, temp.length-1);
            List<String> names = temp2.split(",");
            setState(() {
              myData = temp2;
              print(names);
            });
          }, child: Text("Restore")),
          Text(myData, style: TextStyle(fontSize: 35),),
        ],
      ),
    );
  }
}