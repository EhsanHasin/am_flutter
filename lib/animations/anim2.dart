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
  var op = 0.0;
  var isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // if(isVisible){
        //   op = 0.0;
        //   isVisible = false;
        // }else{
        //   op = 1.0;
        //   isVisible = true;
        // }
        isVisible = isVisible ? false : true;
        setState(() {});
      }),
      body: Container(
        child: AnimatedOpacity(
          opacity: isVisible ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          child: Image.asset("assets/images/photo_2023-01-29_20-10-40.jpg"),
          curve: Curves.bounceIn,
          alwaysIncludeSemantics: true,
        ),
      ),
    );
  }
}
