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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, mainAxisSpacing: 3),
          itemCount: 17,
          itemBuilder: (bc, index) {
            return GestureDetector(
              onTap: (){

              },
              child: GridTile(
                child: Image.asset(
                  "assets/images/pic.jpg",
                  fit: BoxFit.cover,
                ),
                header: Icon(Icons.more_vert),
                footer: Text("This is a footer"),
              ),
            );
          }),
    );
  }
}
