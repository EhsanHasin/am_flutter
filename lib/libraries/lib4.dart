import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:text_to_speech/text_to_speech.dart';

void main() => runApp(MaterialApp(
      title: "english words and text_to_speech",
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
      appBar: AppBar(
        title: Text("english words"),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (c)=>RandomeWordPage()));
        }, icon: Icon(FontAwesomeIcons.random))],
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (c, i) {
              return ListTile(title: Text("Noun = ${nouns[i]} adjective = ${adjectives[i]}"),);
            }),
      ),
    );
  }
}


class RandomeWordPage extends StatelessWidget {
  RandomeWordPage({Key? key}) : super(key: key);
  var newGeneratedWord = adjectives[Random().nextInt(500)];
  var colors = [Colors.red, Colors.green, Colors.blue, Colors.orange];
  TextToSpeech tts = TextToSpeech();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          tts.speak(newGeneratedWord);
          print(newGeneratedWord);
        },
        onDoubleTap: (){
          Navigator.pop(context);
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(child: Text(newGeneratedWord, style: TextStyle(fontSize: 100, color: colors[Random().nextInt(colors.length)]),)),
        ),
      ),
    );
  }
}


