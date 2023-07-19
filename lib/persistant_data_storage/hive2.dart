import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("Books");

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(title: Text("e7 App"),),
      body: ValueListenableBuilder(
          valueListenable: Hive.box("Books").listenable(),
          builder: (bc, box, wid){
            return Center(
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

                          if(tec.text.isNotEmpty){
                            // booksBox.put("MyKey", tec.text);
                            box.add(tec.text);

                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Saved :)"))
                            );
                            tec.clear();

                          }else{
                            ScaffoldMessenger.of(context).showMaterialBanner(
                                MaterialBanner(
                                    content: Text("Enter your book name"),
                                    actions: [ElevatedButton(onPressed: (){
                                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                                    }, child: Text("Ok"))])
                            );
                          }

                        }, child: Text("save")),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: box.length,
                          itemBuilder: (bc,i){
                            return Dismissible(
                              key: Key(i.toString()),
                              child: ListTile(
                                title: Text(box.get(i) ?? "no-name" , style: TextStyle(fontSize: 30),),
                              ),
                            );
                          }
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

}