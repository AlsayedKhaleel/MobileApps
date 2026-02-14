import 'package:hive_flutter/adapters.dart';

class NotesHive {
  static final boxKey = 1;
  static String boxName = "box1";
  static List<String> notes = <String>[];

  // insert a new note.
  static void add(String note) {
    notes.add(note);
    Hive.box(boxName).put(boxKey, notes);
  }

  // update an existing note.
  static void update(String newContent, int index) {
    notes[index] = newContent;
    Hive.box(boxName).put(boxKey, notes);
  }

  // delete a note.
  static void delete(int index) {
    notes.removeAt(index);
    Hive.box(boxName).put(boxKey, notes);
  }

  // delete all notes.
  static void deleteAll() {
    notes.clear();
    Hive.box(boxName).put(boxKey, notes);
  }

  // fetch the whole notes.
  static void getAll() {
    notes = Hive.box(boxName).get(boxKey) ?? [];
  }
}
