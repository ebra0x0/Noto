import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Noto/cubits/edit_note_cubit/cubit/edit_note_cubit.dart';
import 'package:Noto/cubits/edit_note_cubit/cubit/edit_note_state.dart';
import 'package:Noto/helper/modal_bottom_sheet.dart';
import 'package:Noto/models/note_model.dart';
import 'package:Noto/views/widgets/edit_view_body.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import 'widgets/edit_note_colors_list_view.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  static const routeName = '/edit-note';
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  @override
  void initState() {
    BlocProvider.of<EditNoteCubit>(context).setNote(note: widget.note);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditNoteCubit, EditNoteState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(
              state is EditNoteColorChanged ? state.color : widget.note.color),
          appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0.4),
            actions: [
              GestureDetector(
                onTap: () {
                  ShowModalBottomSheet(
                    context: context,
                    widget: Padding(
                      padding: const EdgeInsets.all(24),
                      child: EditNoteColorsList(note: widget.note),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Color(state is EditNoteColorChanged
                      ? state.color
                      : widget.note.color),
                ),
              ),
              SizedBox(width: 16),
              IconButton(
                color: Colors.black45,
                onPressed: () {
                  BlocProvider.of<NotesCubit>(context)
                      .deleteNote(note: widget.note);
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.delete,
                  size: 30,
                ),
              ),
            ],
          ),
          body: EditNoteViewBody(
            note: widget.note,
            color:
                state is EditNoteColorChanged ? state.color : widget.note.color,
          ),
        );
      },
    );
  }
}
