import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:Noto/constants.dart';
import 'package:Noto/models/note_model.dart';
import 'package:Noto/simple_bloc_observer.dart';
import 'app.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNotesBox);
  await Hive.openBox<String>(kThemeBox);

  runApp(const NotesApp());
}
