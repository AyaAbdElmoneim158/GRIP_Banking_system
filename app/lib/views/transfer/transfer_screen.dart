import 'package:app/controller/cubit_transfer/transfer_cubit.dart';
import 'package:app/views/transfer/widgets/transfers_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Transfers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocBuilder<TransferCubit, TransferState>(
          builder: (context, state) {
            var cubit = TransferCubit.get(context);

            return TransfersListView(transfers: cubit.allTransfers);
          },
        ),
      ),
    );
  }
}
