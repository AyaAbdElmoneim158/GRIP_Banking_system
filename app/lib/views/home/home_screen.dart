import 'package:app/views/home/widgets/users_list_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: UsersListView(),
      ),
    );
  }
}

/* floatingActionButton:
          BlocBuilder<AppCubit, AppState>(builder: (context, state) {
        var cubit = AppCubit.get(context);
        return FloatingActionButton(
          onPressed: () {
            cubit.addUsersAtDB();
          },
          child: const Text("Add"),
        );
      }),*/