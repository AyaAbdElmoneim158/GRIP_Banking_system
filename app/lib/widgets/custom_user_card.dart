import 'package:app/model/user_model.dart';
import 'package:app/screens/user_details.dart';
import 'package:flutter/material.dart';

class CustomUserCard extends StatelessWidget {
  const CustomUserCard({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetails(userId: user.userId!),
          ),
        );
      },
      child: Card(
        child: ListTile(
          leading: Image.asset(
            "assets/user.png",
            width: 60,
          ),
          title: Text(user.userName!),
          subtitle: Text(user.userEmail!),
          trailing: Text(user.userCurrentBalance!.toString()),
        ),
      ),
    );
  }
}
