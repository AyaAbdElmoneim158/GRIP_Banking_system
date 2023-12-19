import 'package:app/const.dart';
import 'package:app/controller/cubit_transfer/transfer_cubit.dart';
import 'package:app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferFormScreen extends StatefulWidget {
  final User sender;

  const TransferFormScreen({super.key, required this.sender});

  @override
  // ignore: library_private_types_in_public_api
  _TransferFormScreenState createState() => _TransferFormScreenState();
}

class _TransferFormScreenState extends State<TransferFormScreen> {
  User? selectedReceiver;
  TextEditingController amountController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _showSelectReceiverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<TransferCubit, TransferState>(
          builder: (context, state) {
            var cubit = TransferCubit.get(context);

            return AlertDialog(
              title: const Text('Select Receiver'),
              content: DropdownButton<User>(
                value: selectedReceiver,
                onChanged: (User? newValue) {
                  setState(() {
                    selectedReceiver = newValue;
                  });
                  Navigator.of(context).pop();
                },
                items: cubit.usersForSender
                    .map<DropdownMenuItem<User>>((User user) {
                  return DropdownMenuItem<User>(
                    value: user,
                    child: Text(user.name),
                  );
                }).toList(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Money'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 64),
              Text(
                'Sender: ${widget.sender.name}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                  child: Text(
                    'Receiver: ${selectedReceiver?.name ?? 'Select a receiver'}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _showSelectReceiverDialog();
                    },
                    child: const Text('Select Receiver'),
                  ),
                ),
              ]),
              const SizedBox(height: 16),
              TextFormField(
                controller: amountController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Amount'),
                validator: (val) {
                  if (selectedReceiver == null ||
                      amountController.text.isEmpty) {
                    return 'Data is missing';
                  }
                  final double amount = double.parse(amountController.text);
                  if (amount <= 0 || amount > widget.sender.balance) {
                    return 'Invalid amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              BlocConsumer<TransferCubit, TransferState>(
                listener: (context, state) {
                  if (state is TransferMoneySuccessState) {
                    showSnakeBar(context, "Transfer Money Success");
                    Navigator.pop(context);
                    Navigator.pop(context);
                    // AppCubit.get(context).loadCustomers();
                  }
                  if (state is TransferMoneyErrorState) {
                    showSnakeBar(context, "Transfer Money Error");
                  }
                },
                builder: (context, state) {
                  var cubit = TransferCubit.get(context);

                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.transferMoney(
                              double.parse(amountController.text),
                              widget.sender,
                              selectedReceiver!);
                        }
                      },
                      child: (state is TransferMoneyLoadingState)
                          ? const CircularProgressIndicator()
                          : const Text('Transfer Money'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
