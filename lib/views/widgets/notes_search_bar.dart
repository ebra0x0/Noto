import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Noto/cubits/notes_cubit/notes_cubit.dart';
import 'package:Noto/models/note_model.dart';

class NotesSearchBar extends StatelessWidget {
  const NotesSearchBar({required this.toggleSearch, super.key});

  final void Function() toggleSearch;

  @override
  Widget build(BuildContext context) {
    List<NoteModel> allNotes = BlocProvider.of<NotesCubit>(context).notes!;
    return TextField(
      onChanged: (value) {
        List<NoteModel> foundNotes = [];
        String? text = value.trim();
        if (value.isEmpty) {
          BlocProvider.of<NotesCubit>(context).setNotes(allNotes);
          return;
        }
        foundNotes = allNotes
            .where((note) =>
                note.title.contains(text) || note.subTitle.contains(text))
            .toList();

        BlocProvider.of<NotesCubit>(context).setNotes(foundNotes);
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Note Title ?',
        suffixIcon: IconButton(
          onPressed: () {
            toggleSearch();
            BlocProvider.of<NotesCubit>(context).setNotes(allNotes);
          },
          icon: Icon(Icons.close),
        ),
      ),
    );
  }
}
