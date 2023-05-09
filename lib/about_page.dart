import "package:flutter/material.dart";

void main() {
  var t = new Text(
    "In the name of Allah",
    textDirection: TextDirection.rtl,
    style: TextStyle(fontSize: 30.0, color: Colors.lightGreen),
  );
  var b = ElevatedButton(onPressed: null, child: t);
  runApp(MaterialApp(
    home: b,
  ));
}
