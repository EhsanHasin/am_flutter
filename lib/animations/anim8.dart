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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
        reverseDuration: Duration(seconds: 1));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e7 App"),
        actions: [
          IconButton(
              onPressed: () {
                controller.forward();
              },
              icon: Icon(Icons.play_arrow)),
          IconButton(
              onPressed: () {
                controller.stop();
              },
              icon: Icon(Icons.pause)),
          IconButton(
              onPressed: () {
                controller.reverse();
              },
              icon: Icon(Icons.stop)),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.repeat(reverse: true);
      }),
      body: Container(
        child: FadeTransition(
            opacity: animation,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (c, i) {
                  return ListTile(
                    title: Text(
                      "List item $i",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    leading: Icon(Icons.add_alert_outlined),
                  );
                })),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
