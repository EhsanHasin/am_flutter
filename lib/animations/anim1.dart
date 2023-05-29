import 'dart:math';

import 'package:flutter/material.dart';
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
  var w = 100.0, h = 100.0;
  var colors = [Colors.blue, Colors.red, Colors.green];
  var co = Colors.orange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("e7 App"),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        w = w + 100;
        h = h + 100;
        co = colors[Random().nextInt(colors.length)];
        setState(() {});
      }),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          color: co,
          width: w,
          height: h,
          curve: Curves.bounceOut,
          onEnd: (){
            co = Colors.yellow;
            setState(() {});
            print("animation ended");
          },
        ),
      ),
    );
  }
}