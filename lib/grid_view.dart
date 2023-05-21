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
  var photos = [
    'assets/images/photo_2019-03-15_22-39-23.jpg',
    'assets/images/photo_2019-05-06_08-08-48.jpg',
    'assets/images/photo_2020-03-12_20-10-36.jpg',
    'assets/images/photo_2021-12-30_00-00-23.jpg',
    'assets/images/photo_2023-01-29_20-10-40.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 3),
          itemCount: photos.length,
          itemBuilder: (bc, index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (c)=>FullScreenPhoto(photo: photos[index],)));
              },
              child: GridTile(
                child: Image.asset(
                  photos[index],
                  fit: BoxFit.cover,
                ),
                header: Icon(Icons.more_horiz),
                footer: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("Pic: 1200x800")),
                ),
              ),
            );
          }),
    );
  }
}

class FullScreenPhoto extends StatelessWidget {
  FullScreenPhoto({Key? key, this.photo}) : super(key: key);
  var photo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Image(image: AssetImage(photo), width: double.infinity, height: double.infinity, fit: BoxFit.contain,));
  }
}

