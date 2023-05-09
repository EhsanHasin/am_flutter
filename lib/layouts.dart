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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("e7 Management"),),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
        },
        child: Icon(Icons.add),
      ),
      body: Stack(
        alignment: AlignmentDirectional.centerStart,
        textDirection: TextDirection.rtl,
        children: [
          Container(width: 200, height: 200, color: Colors.black,),
          Container(width: 100, height: 200, color: Colors.red,),
          Container(width: 200, height: 100, color: Colors.green, child: Text("Flutter1"),),
          Text("Flutter2"),
          Positioned(top: 77, right: 20, child: Text("test"),)
        ],
      ),
    );
  }
}


