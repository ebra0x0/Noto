import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Noto/cubits/edit_note_cubit/cubit/edit_note_cubit.dart';
import 'package:Noto/cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import 'package:Noto/views/widgets/custom_text_field.dart';

import 'custom_button.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note, required this.color});

  final NoteModel note;
  final int color;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  TextEditingController titleFieldControler = TextEditingController();
  TextEditingController contentFieldControler = TextEditingController();

  @override
  void initState() {
    titleFieldControler.text = widget.note.title;
    contentFieldControler.text = widget.note.subTitle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, alignment: Alignment.center, children: [
      SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              controller: titleFieldControler,
              onChanged: (value) {
                title = value;
              },
              textSize: 30,
              maxWords: 100,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              controller: contentFieldControler,
              onChanged: (value) {
                content = value;
              },
              textSize: 16,
              maxWords: 5000,
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 250,
            ),
          ],
        ),
      ),
      Positioned(
          bottom: 30,
          child: Container(
            width: 160,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.3),
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: CustomButton(
              title: "Save",
              color: Color(widget.color),
              onTap: () {
                updateNote(context: context, note: widget.note);
              },
            ),
          ))
    ]);
  }

  void updateNote({required BuildContext context, required NoteModel note}) {
    title != null ? note.title = title! : false;
    content != null ? note.subTitle = content! : false;
    note.color = widget.color;
    BlocProvider.of<EditNoteCubit>(context).editNote(note);
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    Navigator.pop(context);
  }
}
