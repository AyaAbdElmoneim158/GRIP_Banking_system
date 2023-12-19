import 'package:app/controller/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      var appCubit = AppCubit.get(context);

      return PageView(
        controller: appCubit.controller,
        onPageChanged: (value) => appCubit.onPageChanged(value),
        physics: const BouncingScrollPhysics(),
        children: appCubit.screens,
      );
    });
  }
}
