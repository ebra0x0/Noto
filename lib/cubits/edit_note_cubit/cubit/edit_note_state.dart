import '../../../models/note_model.dart';

class EditNoteState {}

class EditNoteInitial extends EditNoteState {}

class EditNoteSuccess extends EditNoteState {
  final NoteModel note;

  EditNoteSuccess({required this.note});
}

class EditNoteColorChanged extends EditNoteState {
  final int color;
  EditNoteColorChanged({required this.color});
}
