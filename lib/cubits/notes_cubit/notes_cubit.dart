import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:Noto/constants.dart';
import 'package:Noto/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);

    notes = notesBox.values.toList();

    emit(NotesSuccess(notes: notes));
  }

  void deleteNote({required NoteModel note}) {
    note.delete();
    fetchAllNotes();
  }

  void setNotes(List<NoteModel> notes) {
    emit(NotesSuccess(notes: notes));
  }
}
