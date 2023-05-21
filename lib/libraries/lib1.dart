import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(
    MaterialApp(
      title: "font awesome",
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("font awesome"),),
      body: Container(
        child: Column(
          children: [
            Icon(FontAwesomeIcons.wheatAwn),
            FaIcon(FontAwesomeIcons.arrowRotateLeft, size: 70, color: Colors.lightGreen,),
            FaIcon(FontAwesomeIcons.person, size: 70, color: Colors.lightGreen,),
            FaIcon(FontAwesomeIcons.prescription, size: 70, color: Colors.lightGreen,),
            FaIcon(FontAwesomeIcons.cube, size: 70, color: Colors.lightGreen,),
            FaIcon(FontAwesomeIcons.apple, size: 70, color: Colors.lightGreen,),
            FaIcon(FontAwesomeIcons.orcid, size: 70, color: Colors.lightGreen,),
          ],
        ),
      ),
    );
  }
}