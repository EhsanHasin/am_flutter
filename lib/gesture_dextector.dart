import 'dart:math';

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

  var myColor = Colors.orange;
  var colors = [Colors.orange,
    Colors.red,
    Colors.lightGreen,
    Colors.purple,
    Colors.cyan,
    Colors.blue,
    Colors.yellow];
  var myTitle = "Demo app";

  var left = 50.0;
  var top = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myTitle),
      ),
      body: Stack(
        children: [
          Positioned(
            left: left,
            top: top,
            child: GestureDetector(
                onTap: (){
                  myColor = colors[Random().nextInt(colors.length)];
                  myTitle = "Single Clicked";
                  top = top + 10;
                  left = left + 10;
                  setState(() {});
                },
                onDoubleTap: (){
                  myTitle = "Double Clicked";
                  setState(() {});
                },
                onLongPress: (){
                  myTitle = "onLongPress";
                  setState(() {});
                },
                onPanUpdate: (ud){
                  left = left + ud.delta.dx;
                  top = top + ud.delta.dy;
                  if(left < 0) {
                    myColor = Colors.red;
                    }else {
                    myColor = colors[Random().nextInt(colors.length)];
                  }
                  setState(() {});
                },
                child: Container(
                  width: 200,
                  height: 200,
                  color: myColor,
            )),
          )
        ],
      ),
    );
  }
}
