import 'package:app/model/user_model.dart';
import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.user,
    required this.onTap,
  });

  final User user;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person, color: Colors.grey,),
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Text(user.balance.toString()),
      onTap: onTap,
    );
  }
}
