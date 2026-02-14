import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/notes_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  await Hive.openBox(NotesHive.boxName);

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

// clear all
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController inputFieldController = TextEditingController();
  static List<Color> colors = [
    Color(0xFF91F48F),
    Color(0xFFFFF599),
    Color(0xFFFF9E9E),
    Color(0xFFB69CFF),
    Color(0xFF9EFFFF),
  ];

  @override
  void initState() {
    NotesHive.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3B3B3B),
      appBar: AppBar(
        backgroundColor: Color(0xFF3B3B3B),
        title: Text(
          "Notes",
          style: TextStyle(
            fontFamily: "semibold",
            fontSize: 43,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 178, 157, 157),
              borderRadius: BorderRadius.circular(15),
            ),
            width: 50,
            height: 50,
            child: Icon(Icons.search),
          ),
          SizedBox(width: 15),
          InkWell(
            onTap: () {
              NotesHive.deleteAll();
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 178, 157, 157),
                borderRadius: BorderRadius.circular(15),
              ),
              width: 50,
              height: 50,
              child: Icon(Icons.delete),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),

      body: ListView.builder(
        itemCount: NotesHive.notes.length,
        itemBuilder: (c, i) => InkWell(
          // delete a note.
          onLongPress: () {
            NotesHive.delete(i);
            setState(() {});
          },

          onTap: () async {
            inputFieldController.text = NotesHive.notes[i];
            AlertDialog alert = AlertDialog(
              title: Text("Update"),
              content: TextField(controller: inputFieldController),
              actions: [
                TextButton(
                  onPressed: () {
                    NotesHive.update(inputFieldController.text, i);
                    setState(() {});
                    inputFieldController
                        .clear(); // remove the text of the privious note.
                    Navigator.pop(context);
                  },
                  child: Text("Save"),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
              ],
            );

            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              },
            );
          },
          child: Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colors[i%colors.length],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  NotesHive.notes[i],
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
          ),
        ),
      ),

      // adding a new note.
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 178, 157, 157),
        child: Icon(Icons.add),
        onPressed: () async {
          AlertDialog alert = AlertDialog(
            title: Text("Add Note"),
            content: TextField(controller: inputFieldController),
            actions: [
              TextButton(
                onPressed: () {
                  if (inputFieldController.text != "") {
                    NotesHive.add(inputFieldController.text);
                    setState(() {});
                    inputFieldController
                        .clear(); // remove the text of the privious note.
                    Navigator.pop(context);
                  }
                },
                child: Text("Add"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
            ],
          );

          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        },
      ),
    );
  }
}