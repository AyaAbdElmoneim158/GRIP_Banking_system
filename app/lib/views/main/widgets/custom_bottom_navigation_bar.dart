import 'package:app/controller/app_cubit/app_cubit.dart';
import 'package:app/views/main/widgets/build_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      var appCubit = AppCubit.get(context);

      return buildBottomNavigationBar(
        items: appCubit.items(),
        onTap: (value) => appCubit.onSelected(value),
        currentIndex: appCubit.currentPage,
      );
    });
  }
}
