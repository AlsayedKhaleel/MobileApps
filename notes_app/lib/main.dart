import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubit/cubit/notes_cubit.dart';
import 'package:notes_app/notes_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  await Hive.openBox(NotesHive.boxName);

  runApp(
    BlocProvider(
      create: (context) => NotesCubit()..fetchNotes(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // read the text inserted by the user at the text form field.
  TextEditingController inputFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotesCubit>();

    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              backgroundColor: backgroundColor,
              title: const Text(
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
                    color: Color(0xFF3B3B3B),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 50,
                  height: 50,
                  child: Icon(Icons.search, color: Colors.white,),
                ),
                SizedBox(width: 15),
                InkWell(
                  onTap: () {
                    cubit.clearNotes();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF3B3B3B),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 50,
                    height: 50,
                    child: Icon(Icons.delete, color: Colors.white,),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),

            body: BlocBuilder<NotesCubit, NotesState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: NotesHive.notes.length,
                  itemBuilder: (c, i) => InkWell(
                    // delete a note.
                    onLongPress: () {
                      cubit.deleteNote(i: i);
                    },

                    onTap: () async {
                      // copy the content of this note to the controller.
                      inputFieldController.text = NotesHive.notes[i];

                      AlertDialog alert = AlertDialog(
                        title: const Text("Update Note"),
                        content: TextField(controller: inputFieldController),
                        actions: [
                          TextButton(
                            onPressed: () {
                              if (inputFieldController.text.trim().isNotEmpty) {
                                cubit.updateNote(
                                  text: inputFieldController.text,
                                  i: i,
                                );
                              } else {
                                cubit.deleteNote(i: i);
                              }
                              inputFieldController.clear();
                              Navigator.pop(context);
                            },
                            child: const Text("Save"),
                          ),
                          TextButton(
                            onPressed: () {
                              inputFieldController.clear();
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel"),
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
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: colors[i % colors.length],
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
                );
              },
            ),

            // adding a new note.
            floatingActionButton: FloatingActionButton(
              backgroundColor: backgroundColor,
              foregroundColor: Colors.white,
              child: Icon(Icons.add),

              onPressed: () async {
                inputFieldController.clear();

                AlertDialog alert = AlertDialog(
                  title: const Text("Add Note"),
                  content: TextField(controller: inputFieldController),
                  actions: [
                    TextButton(
                      onPressed: () {
                        if (inputFieldController.text.trim().isNotEmpty) {
                          cubit.addNote(text: inputFieldController.text);
                        }
                        inputFieldController.clear();
                        Navigator.pop(context);
                      },
                      child: const Text("Add"),
                    ),
                    TextButton(
                      onPressed: () {
                        inputFieldController.clear();
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
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
        },
      ),
    );
  }
}
