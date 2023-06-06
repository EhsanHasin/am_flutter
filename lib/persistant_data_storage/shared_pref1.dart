import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

final String FIRST_NAME = "fisrt_name";
final String LAST_NAME = "last_name";
final String AGE = "age";

class _HomePageState extends State<HomePage> {

  late SharedPreferences preferences;
  String firstName= "", lastName= "", age= "";
  var data = "";
  TextEditingController tecFN = TextEditingController();
  TextEditingController tecLN = TextEditingController();
  TextEditingController tecA = TextEditingController();
  String? eFN, eLN , eA ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Share Preferences",
                style: TextStyle(fontSize: 30),
              ),
              TextField(
                controller: tecFN,
                decoration: InputDecoration(hintText: "First Name", errorText: eFN),
                onChanged: (fn) {
                  firstName = fn;
                  if(fn.isNotEmpty) eFN = null;
                  setState(() {});
                },
              ),
              TextField(
                controller: tecLN,
                decoration: InputDecoration(hintText: "Last Name", errorText: eLN),
                onChanged: (ln) {
                  lastName = ln;
                  if(ln.isNotEmpty) eLN = null;
                  setState(() {});
                },
              ),
              TextField(
                controller: tecA,
                decoration: InputDecoration(hintText: "age", errorText: eA),
                onChanged: (age) {
                  this.age = age;
                  if(age.isNotEmpty) eA = null;
                  setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async{
                      if(tecFN.text.isEmpty){
                        setState(() {
                          eFN = "Enter your first name";
                        });
                        return;
                      }

                      if(tecLN.text.isEmpty){
                        setState(() {
                          eLN = "Enter your last name";
                        });
                        return;
                      }

                      if(tecA.text.isEmpty){
                        setState(() {
                          eA = "Enter your age";
                        });
                        return;
                      }

                      preferences = await SharedPreferences.getInstance();
                      await preferences.setString(FIRST_NAME, firstName);
                      await preferences.setString(LAST_NAME, lastName);
                      await preferences.setString(AGE, age);
                      tecFN.clear();
                      tecLN.clear();
                      tecA.clear();
                      setState(() {});
                },
                    child: Text("Save")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async{
                  preferences = await SharedPreferences.getInstance();
                  firstName = preferences.getString(FIRST_NAME) ?? "no name";
                  lastName = preferences.getString(LAST_NAME) ?? "no last name";
                  age = preferences.getString(AGE) ?? "no age";
                  data = "you are $firstName $lastName and your age is $age years old";
                  setState(() {});
                },
                    child: Text("Restore")),
              ),
              Text(
                "Data = $data",
                style: TextStyle(fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async{
                      preferences = await SharedPreferences.getInstance();
                      var bfn = await preferences.remove(FIRST_NAME);
                      var bln = await preferences.remove(LAST_NAME);
                      var ba = await preferences.remove(AGE);
                      if(bfn && bln && ba){
                        setState(() {
                          data = "";
                        });
                      }
                    },
                    child: Text("Delete")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
