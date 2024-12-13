import 'package:Noto/models/note_model.dart';
import 'package:Noto/views/edit_note_view.dart';
import 'package:Noto/views/notes_view.dart';
import 'package:Noto/views/splash_view.dart';

import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = NotesView.routeName;
  static const kEditNoteView = EditNoteView.routeName;

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const NotesView(),
      ),
      GoRoute(
        path: kEditNoteView,
        builder: (context, state) {
          final note = state.extra as NoteModel?;
          if (note == null) {
            throw Exception('Note argument is required for EditNoteView');
          }
          return EditNoteView(note: note);
        },
      ),
    ],
  );
}
