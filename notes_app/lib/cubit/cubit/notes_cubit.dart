import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/notes_hive.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  // load the notes from the DB.
  void fetchNotes() {
    NotesHive.getAll();
    emit(ChangeNoteState());
  }

  // insert a new note.
  void addNote({required String text}) {
    NotesHive.add(text);
    emit(ChangeNoteState());
  }

  // change the content of ith note.
  void updateNote({required String text, required int i}) {
    text == "" ? NotesHive.delete(i) : NotesHive.update(text, i);
    emit(ChangeNoteState());
  }

  // delete this ith note.
  void deleteNote({required int i}) {
    NotesHive.delete(i);
    emit(ChangeNoteState());
  }

  // remove the whole notes from the DB.
  void clearNotes() {
    NotesHive.deleteAll();
    emit(ChangeNoteState());
  }
}
