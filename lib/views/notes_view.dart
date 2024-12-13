import 'package:Noto/views/widgets/nav_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Noto/helper/modal_bottom_sheet.dart';
import 'package:Noto/views/widgets/add_note_bottom_sheet.dart';
import 'package:Noto/views/widgets/notes_view_body.dart';
import 'widgets/custom_button_theme.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'widgets/custom_icon.dart';
import 'widgets/notes_search_bar.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});
  static const String routeName = '/home';
  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  bool isSearch = false;

  void toggleSearch() {
    setState(() {
      isSearch = !isSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:
            isSearch ? NotesSearchBar(toggleSearch: toggleSearch) : NavLogo(),
        actions: [
          CustomIconButton(
            onPressed: () {
              setState(() {
                isSearch = !isSearch;
              });
            },
            icon: Icons.search,
          ),
          SizedBox(
            width: 6,
          ),
          CustomButtonTheme(),
          SizedBox(
            width: 8,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowModalBottomSheet(
              context: context,
              widget: BlocProvider<AddNoteCubit>(
                create: (context) => AddNoteCubit(),
                child: const AddNoteBottomSheet(),
              ));
        },
        child: const Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}
