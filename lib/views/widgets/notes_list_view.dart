import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Noto/cubits/notes_cubit/notes_cubit.dart';
import 'package:Noto/helper/scroll_service.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesSuccess &&
            state.notes != null &&
            state.notes!.isNotEmpty) {
          ScrollService().scrollToEnd();
          return Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 50),
            child: Align(
                alignment: Alignment.topCenter,
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  itemBuilder: (context, index) => NoteCard(
                      note: state.notes![state.notes!.length - index - 1]),
                  itemCount: state.notes!.length,
                )),
          );
        } else {
          return const Center(
            child: Text(
              'Add your first note',
              style: TextStyle(fontSize: 20),
            ),
          );
        }
      },
    );
  }
}
