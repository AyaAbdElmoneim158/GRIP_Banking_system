import 'package:app/model/transfer_model.dart';
import 'package:flutter/material.dart';

class TransfersListView extends StatelessWidget {
  const TransfersListView({super.key, required this.transfers});
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
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      Text(transfers[index].senderName),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/transfer.png',
                        width: 40,
                      ),
                      Text(transfers[index].amount.toString()),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      Text(transfers[index].receiverName),
                    ],
                  ),
                ],
              );
            },
          );
  }
}
