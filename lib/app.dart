import 'package:Noto/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Noto/constants.dart';
import 'package:Noto/cubits/edit_note_cubit/cubit/edit_note_cubit.dart';
import 'package:Noto/cubits/notes_cubit/notes_cubit.dart';
import 'package:Noto/cubits/theme_cubit/cubit/theme_cubit.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesCubit()..fetchAllNotes()),
        BlocProvider(create: (context) => EditNoteCubit()),
        BlocProvider(create: (mcontext) => ThemeCubit()..fetchTheme(context)),
      ],
      child: BlocBuilder<ThemeCubit, AppTheme>(
        builder: (context, theme) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            theme: ThemeData(
                primaryColor: kPrimaryColor,
                brightness: theme == AppTheme.light
                    ? Brightness.light
                    : Brightness.dark,
                fontFamily: 'Poppins'),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
