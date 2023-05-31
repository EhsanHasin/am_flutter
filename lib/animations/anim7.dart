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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  var state = true;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2,), reverseDuration: Duration(seconds: 2));

    // controller.forward();
    // controller.repeat(reverse: true);

    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            if(state){
              controller.forward();
              state = false;
            }else{
              controller.reverse();
              state = true;
            }

          },
            child: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: animation,
          size: 50,
        )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
