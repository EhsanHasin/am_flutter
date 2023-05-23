import 'package:flutter_spinkit/flutter_spinkit.dart';
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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      body: Container(
          child: Column(
        children: [
          SpinKitRotatingCircle(
            color: Colors.blue,
            size: 50.0,
          ),
          SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.red : Colors.green,
                ),
              );
            },
          ),
          SpinKitSquareCircle(
            color: Colors.green,
            size: 50.0,
            controller: AnimationController(
                vsync: this, duration: const Duration(milliseconds: 1200)),
          ),
        ],
      )),
    );
  }
}
