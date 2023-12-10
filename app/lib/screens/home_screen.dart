import 'package:app/model/user_model.dart';
import 'package:app/widgets/custom_user_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              CustomUserCard(user: UserModel.dummyUser[0]),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: 20,
        ),
      ),
    );
  }
}
