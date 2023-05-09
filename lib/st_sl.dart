import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyStateLessWidgetApp(),
            MyStatefullWidgetApp(),
            // MyNewText(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     MyContainer(),
            //     MyContainer(),
            //     MyContainer(),
            //   ],
            // ),
            // MyStyledText(),
            // MyNewText(),
            // MyContainer(),
            // MyStyledText(),
          ],
        ),
      ),
    ),
  ));
}


class MyStateLessWidgetApp extends StatelessWidget {
  var count = 0;
  MyStateLessWidgetApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Number of Clicked = $count"),
        ElevatedButton(onPressed: (){
          count++;
        }, child: Text("کلیک کنید"))
      ],
    );
  }
}

class MyStatefullWidgetApp extends StatefulWidget {
  const MyStatefullWidgetApp({Key? key}) : super(key: key);

  @override
  State<MyStatefullWidgetApp> createState() => _MyStatefullWidgetAppState();
}

class _MyStatefullWidgetAppState extends State<MyStatefullWidgetApp> {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Number of Clicked = $count"),
        ElevatedButton(onPressed: (){
          setState(() {
            count++;
          });
        }, child: Text("کلیک کنید +")),
        ElevatedButton(onPressed: (){
          setState(() {
            count--;
          });
        }, child: Text("کلیک کنید -"))
      ],
    );
  }
}


class MyNewText extends StatelessWidget {
  const MyNewText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Flutter is Google Framework");
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      color: Colors.green,
      child: Icon(Icons.pedal_bike_sharp, size: 40,),
    );
  }
}

class MyStyledText extends StatelessWidget {
  const MyStyledText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("My widget is red", style: TextStyle(fontSize: 40, color: Colors.red),);
  }
}




