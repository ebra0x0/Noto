import 'package:Noto/cubits/theme_cubit/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class NavLogo extends StatelessWidget {
  const NavLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppTheme>(
      builder: (context, state) {
        final theme = state == AppTheme.light ? 'light' : 'dark';
        return SvgPicture.asset(
          'assets/images/nav-logo-$theme.svg',
          height: 40,
          width: 40,
        );
      },
    );
  }
}
