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
  var t = 0.0;
  var l = 0.0;
  var r = 0.0;
  var b = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
              child: Stack(
                  children: [
                AnimatedPositioned(
                  top: t,
                  left: l,
                  child: Container(
                    color: Colors.purple,
                    width: 100,
                    height: 100,
                  ),
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.bounceOut,
                ),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        l = l + 60;
                      });
                    },
                    icon: Icon(Icons.arrow_forward)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        l = l - 60;
                      });
                    },
                    icon: Icon(Icons.arrow_back)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        t = t - 60;
                      });
                    },
                    icon: Icon(Icons.arrow_upward)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        t = t + 60;
                      });
                    },
                    icon: Icon(Icons.arrow_downward)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
