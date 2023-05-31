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
  var state = CrossFadeState.showFirst;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        if (state == CrossFadeState.showFirst) {
          state = CrossFadeState.showSecond;
        } else {
          state = CrossFadeState.showFirst;
        }
        setState(() {});
      }),
      body: Center(
        child: AnimatedCrossFade(
          firstChild: Image.asset("assets/man-frowning.png"),
          secondChild: Image.asset("assets/man-health-worker.png"),
          crossFadeState: state,
          duration: Duration(seconds: 2),
          firstCurve: Curves.bounceIn,
          secondCurve: Curves.bounceOut,
        ),
      ),
    );
  }
}
