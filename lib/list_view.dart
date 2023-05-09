import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
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
  var title = "Flutter with ListView";
  var names = ["Foo", "Bar", "Baz"];
  var icons = [Icons.add, Icons.ac_unit, Icons.add_alert_outlined];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        names.add("new Foo ${Random().nextInt(1000)}");
        icons.add(Icons.new_releases);
        setState(() {});
      }),
      body: ListView.separated(
        itemCount: names.length,
        itemBuilder: (bc, i) {
          return ListTile(
            title: Text(names[i]),
            leading: Icon(icons[i]),
            subtitle: Text("0799159483942"),
            onTap: () {
              setState(() {
                title = "Selected $i";
              });
            },
          );
        },
        separatorBuilder: (bc, i) {
          return Divider(
            thickness: 3,
            indent: 30,
            endIndent: 30,
          );
        },
      ),
    );
  }
}

// ListView(
// children: [
// ListTile(
// title: Text("Ahmad Ahmad"),
// leading: Icon(Icons.person),
// subtitle: Text("0799159483942"),
// trailing: Icon(Icons.arrow_forward),
// selectedTileColor: Colors.purple,
// splashColor: Colors.black87,
// focusColor: Colors.red,
// hoverColor: Colors.yellow,
// selectedColor: Colors.green,
// selected: sel,
// onTap: (){
// setState(() {
// title = "single Tap";
// sel = sel ? false : true;
// });
// },
// onLongPress: (){
// setState(() {
// title = "long pressed";
// });
// },
// ),
// Divider(color: Colors.grey, height: 2, thickness: 1, indent: 30, endIndent: 30,),
// ListTile(
// title: Text("Ahmad Ahmad"),
// leading: Icon(Icons.person),
// subtitle: Text("0799159483942"),
// selected: true,
// onTap: (){},
// ),
// Divider(color: Colors.grey, height: 2, thickness: 1, indent: 30, endIndent: 30,),
// ListTile(
// title: Text("Ahmad Ahmad"),
// leading: Icon(Icons.person),
// subtitle: Text("0799159483942"),
// onTap: (){},
// ),
// ListTile(
// title: Text("Ahmad Ahmad"),
// leading: Icon(Icons.person),
// subtitle: Text("0799159483942"),
// ),
// ListTile(
// title: Text("Ahmad Ahmad"),
// leading: Icon(Icons.person),
// subtitle: Text("0799159483942"),
// ),
// ListTile(
// title: Text("Ahmad Ahmad"),
// leading: Icon(Icons.person),
// subtitle: Text("0799159483942"),
// ),
// ListTile(
// title: Text("Ahmad Ahmad"),
// leading: Icon(Icons.person),
// subtitle: Text("0799159483942"),
// ),
// ListTile(
// title: Text("Ahmad Ahmad"),
// leading: Icon(Icons.person),
// subtitle: Text("0799159483942"),
// ),
// ListTile(
// title: Text("Ahmad Ahmad"),
// leading: Icon(Icons.person),
// subtitle: Text("0799159483942"),
// ),
// ListTile(
// title: Text("Ahmad Ahmad"),
// leading: Icon(Icons.person),
// subtitle: Text("0799159483942"),
// ),
// ListTile(
// title: Text("Ahmad Ahmad"),
// leading: Icon(Icons.person),
// subtitle: Text("0799159483942"),
// ),
// ListTile(
// title: Text("Ahmad Ahmad"),
// leading: Icon(Icons.person),
// subtitle: Text("0799159483942"),
// ),
// ListTile(
// title: Text("Ahmad Ahmad"),
// leading: Icon(Icons.person),
// subtitle: Text("0799159483942"),
// ),
// ],
// )
