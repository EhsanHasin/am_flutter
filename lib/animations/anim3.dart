import 'package:flutter/material.dart';

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

class _HomePageState extends State<HomePage> {
  var pd = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          pd = pd + 10;
        });
      }),
      body: Container(
        child: AnimatedPadding(
          padding: EdgeInsets.symmetric(vertical: pd),
          duration: Duration(seconds: 2),
          child: Container(
            width: 100,
            height: 100,
            child: Text("ٌWorking on Padding :)"),
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
