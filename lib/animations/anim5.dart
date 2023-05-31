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
  Widget myChild = Image.asset("assets/man-frowning.png");
  var state = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        if(state){
          myChild = Image.asset("assets/man-health-worker.png");
          state = false;
        }else{
          myChild = Image.asset("assets/man-frowning.png");
          state = true;
        }
        setState(() {});
      }),
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(seconds:2),
          child: myChild,
          switchInCurve: Curves.bounceIn,
          switchOutCurve: Curves.bounceOut,
        ),
      ),
    );
  }
}
