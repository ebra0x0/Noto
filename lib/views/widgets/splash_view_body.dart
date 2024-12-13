import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../cubits/theme_cubit/cubit/theme_cubit.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppTheme>(
      builder: (context, state) {
        final theme = state == AppTheme.light ? 'light' : 'dark';
        return Center(
          child: SvgPicture.asset(
            'assets/images/splash-logo-$theme.svg',
            height: 80,
            width: 80,
          ),
        );
      },
    );
  }
}
