import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  runApp(
      MaterialApp(
        title: "e7 App",
        theme: ThemeData(
            primarySwatch: Colors.blue
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      )
  );
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var tec = TextEditingController();
  List<String?> books = [];
  late Box<String> booksBox;

  @override
  void initState() {
    openMyBox();
    print("your box of Books is opened :)");
    super.initState();
  }

  void openMyBox() async{
    booksBox = await Hive.openBox("Books");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("e7 App"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller:  tec,
                decoration: InputDecoration(hintText: "Enter your book name"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){

                    // booksBox.put("MyKey", tec.text);
                    booksBox.add(tec.text);

                  }, child: Text("save")),
                  ElevatedButton(onPressed: (){

                    // String? temp = booksBox.get("MyKey");
                    // print(temp);

                    books = booksBox.keys.map((key) => booksBox.get(key)).toList();

                    setState(() {

                    });

                  }, child: Text("Restore")),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (bc,i){
                      return ListTile(
                        title: Text(books[i] ?? "no-name" , style: TextStyle(fontSize: 30),),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}