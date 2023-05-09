import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Calculator"),),
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var fn;
  var sn;
  var resutl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Calculator", style: TextStyle(fontSize: 30, color: Colors.lightBlue, fontWeight: FontWeight.bold),),
          SizedBox(height: 7,),
          TextField(
            decoration: InputDecoration(
              hintText: "First Number",
              labelText: "First Number",
              border: OutlineInputBorder()
            ),
            onChanged: (String text){
              fn = text;
            },
          ),
          SizedBox(height: 7,),
          TextField(
            decoration: InputDecoration(
                hintText: "Second Number",
                labelText: "Second Number",
                border: OutlineInputBorder()
            ),
            onChanged: (text){
              sn = text;
            },
          ),
          SizedBox(height: 7,),
          ElevatedButton(onPressed: (){
            setState(() {
              int ifn = int.parse(fn);
              int isn = int.parse(sn);
              resutl = ifn+ isn;
            });
          }, child: Text("Calculate")),
          SizedBox(height: 7,),
          Text("Result = $resutl"),
        ],
      ),
    );
  }
}
