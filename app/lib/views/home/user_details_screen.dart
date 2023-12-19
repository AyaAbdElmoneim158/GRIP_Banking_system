import 'package:app/controller/cubit_transfer/transfer_cubit.dart';
import 'package:app/views/home/transfer_form_screen.dart';
import 'package:app/views/home/widgets/transfers_list_view_for_sender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferCubit, TransferState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TransferCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Customer Details'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              cubit.getUsersForSender(cubit.user.id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransferFormScreen(
                    sender: cubit.user,
                  ),
                ),
              );
            },
            child: const Text('Transfer'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    child: ListTile(
                      title: Text(cubit.user.name),
                      subtitle: Text(cubit.user.email),
                      trailing: Text(cubit.user.balance.toStringAsFixed(2)),
                    ),
                  ),
                  Expanded(
                    child: TransfersListViewForSender(
                      transfers: cubit.transfersForSender,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
