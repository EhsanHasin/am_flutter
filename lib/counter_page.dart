import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    debugShowCheckedModeBanner: false,
    home: MyNewStateFullWidget(),
  ));
}

// class MyNewWidget extends StatelessWidget {
//   const MyNewWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // return Text("This is my new widget", style: TextStyle(fontSize: 77),);
//     return Icon(Icons.ac_unit);
//   }
// }

class MyNewStateFullWidget extends StatefulWidget {
  const MyNewStateFullWidget({Key? key}) : super(key: key);

  @override
  State<MyNewStateFullWidget> createState() => _MyNewStateFullWidgetState();
}

class _MyNewStateFullWidgetState extends State<MyNewStateFullWidget> {

  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.lightGreen,
          child: Text("Counter = $count"),
        ),
      ),
      appBar: AppBar(
        title: Text("Counter Application Application Application Application Application Application Application"),
        leading: Icon(Icons.add_alert_outlined),
        actions: [
          Icon(Icons.settings),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(count);
         setState(() {
           count++;
         });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}





