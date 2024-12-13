import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Noto/constants.dart';
import 'package:Noto/cubits/add_note_cubit/add_note_cubit.dart';

import 'color_item.dart';

class AddNoteColorsListView extends StatefulWidget {
  const AddNoteColorsListView({super.key});

  @override
  State<AddNoteColorsListView> createState() => _AddNoteColorsListViewState();
}

class _AddNoteColorsListViewState extends State<AddNoteColorsListView> {
  int currentIndex = 0;

  @override
  void initState() {
    BlocProvider.of<AddNoteCubit>(context)
        .changeColor(color: kColors[currentIndex]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context)
                  .changeColor(color: kColors[index]);
              setState(() {});
            },
            child: ColorItem(
              color: kColors[index],
              isActive: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}
