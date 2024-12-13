import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/theme_cubit/cubit/theme_cubit.dart';
import 'custom_icon.dart';

class CustomButtonTheme extends StatelessWidget {
  const CustomButtonTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppTheme>(
      builder: (context, theme) {
        return CustomIconButton(
          onPressed: () {
            BlocProvider.of<ThemeCubit>(context).toggleTheme();
          },
          icon: theme == AppTheme.light ? Icons.dark_mode : Icons.light_mode,
        );
      },
    );
  }
}
