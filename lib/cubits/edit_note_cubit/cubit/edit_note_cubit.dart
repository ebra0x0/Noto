import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../models/note_model.dart';
import 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());

  late NoteModel note;
  Color color = Color(0xff000000);
  void setNote({required NoteModel note}) {
    this.note = note;
    color = Color(note.color);
    emit(EditNoteInitial());
  }

  void changeColor({required Color color}) {
    this.color = color;
    emit(EditNoteColorChanged(color: color.value));
  }

  void editNote(NoteModel note) {
    note.save();
    emit(EditNoteSuccess(note: note));
  }
}
