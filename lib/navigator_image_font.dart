import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "e7 App",
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "hasin"),
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
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Practice of Nvaigator, Image and Font"),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (b) => SecondPage()));
                },
                icon: Icon(Icons.arrow_forward)),
            Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/2560px-Google-flutter-logo.svg.png", width: 200, height: 200,fit: BoxFit.fill,),
            Image.asset("assets/images/new/calendar.png"),
            Image.asset("assets/images/alarm-clock.png"),
            Text("Flutter is greate", style: TextStyle(fontSize: 25),),
            Text("Flutter is greate", style: TextStyle(fontSize: 25, fontFamily: "Roboto"),),
            Text("Flutter is greate", style: TextStyle(fontSize: 25, fontFamily: "hasin"),)
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Page"),
        ),
        body: Center(
            child: MaterialButton(
              onPressed: () {Navigator.pop(context);},
              color: Colors.brown,
              child: Text("Back"),
        )));
  }
}
