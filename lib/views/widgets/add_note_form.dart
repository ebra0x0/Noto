import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:Noto/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:Noto/helper/lighten_color.dart';
import 'package:Noto/models/note_model.dart';

import 'add_note_colors_list_view.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',
            textSize: 24,
            maxWords: 100,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'Note',
            textSize: 16,
            maxWords: 5000,
          ),
          const SizedBox(
            height: 32,
          ),
          const AddNoteColorsListView(),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                title: "Add",
                color: lightenColor(
                    color: BlocProvider.of<AddNoteCubit>(context).color,
                    lightRate: 0.3),
                onTap: () {
                  addNote();
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  void addNote() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var currentDate = DateTime.now();

      var formattedCurrentDate = DateFormat('MMM d, yyyy').format(currentDate);
      var noteModel = NoteModel(
          title: title!,
          subTitle: subTitle!,
          date: formattedCurrentDate,
          color: Colors.blue.value);
      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
