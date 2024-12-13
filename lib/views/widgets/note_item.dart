import 'package:Noto/app_router.dart';
import 'package:flutter/material.dart';
import 'package:Noto/models/note_model.dart';
import 'package:go_router/go_router.dart';
import '../../helper/lighten_color.dart';
import 'note_content.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kEditNoteView, extra: note);
      },
      child: Container(
        constraints: BoxConstraints(maxHeight: 4300),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(note.color),
              lightenColor(color: Color(note.color), lightRate: 0.3),
            ],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: NoteContent(note: note),
      ),
    );
  }
}
