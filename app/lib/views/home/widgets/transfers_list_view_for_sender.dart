import 'package:app/model/transfer_model.dart';
import 'package:flutter/material.dart';

class TransfersListViewForSender extends StatelessWidget {
  const TransfersListViewForSender({super.key, required this.transfers});
  final List<Transfer> transfers;

  @override
  Widget build(BuildContext context) {
    return transfers.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/transfer.png',
                  width: 150,
                ),
                const Text("Transfer is empty"),
              ],
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: transfers.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(transfers[index].receiverName),
                subtitle: Text(transfers[index].receiverEmail),
                trailing: Text(transfers[index].amount.toString()),
              );
            },
          );
  }
}
