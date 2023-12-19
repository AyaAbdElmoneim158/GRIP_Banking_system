// Implement the view all customers screen and customer details
import 'package:app/controller/cubit_transfer/transfer_cubit.dart';
import 'package:app/views/home/user_details_screen.dart';
import 'package:app/views/home/widgets/user_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferCubit, TransferState>(
      builder: (context, state) {
        var cubit = TransferCubit.get(context);
        var allUsers = cubit.allUsers;

        return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: allUsers.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => UserListTile(
                  user: allUsers[index],
                  onTap: () async {
                    await cubit.getUser(allUsers[index].id);
                    await cubit.getTransfersForSender(allUsers[index].id);
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserDetailsScreen(),
                      ),
                    );
                  },
                ));
      },
    );
  }
}
