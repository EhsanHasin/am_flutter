import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("e7 App"),),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Fluttertoast.showToast(
                  msg: "you have successfully singed in :)",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 20.0
              );
            }, child: Text("Toast #1")),
          ],
        ),
      ),
    );
  }
}