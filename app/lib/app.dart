import 'package:app/controller/app_cubit/app_cubit.dart';
import 'package:app/controller/cubit_transfer/transfer_cubit.dart';
import 'package:app/views/main/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(
            create: (context) => TransferCubit()
              ..getAllUsers()
              ..addUsersAtDB()
              ..getAllTransfers()),
      ],
      child: MaterialApp(
        title: 'Money Transfer App',
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(appBarTheme: const AppBarTheme(centerTitle: true)),
        home: const SplashScreen(),
      ),
    );
  }
}
/*
import 'package:app/const.dart';
import 'package:app/controller/cubit_transfer/transfer_cubit.dart';
import 'package:app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferFormScreen extends StatelessWidget {
  const TransferFormScreen({super.key, required this.sender});
  final User sender;

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    void showSelectReceiverDialog() {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Select Receiver'),
                content: BlocConsumer<TransferCubit, TransferState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var cubit = TransferCubit.get(context);
                    return DropdownButton<User>(
                      value: cubit.selectedReceiver,
                      onChanged: (val) {
                        cubit.onChanged(val, context);
                      },
                      items: cubit.usersForSender
                          .map<DropdownMenuItem<User>>((User user) {
                        return DropdownMenuItem<User>(
                          value: user,
                          child: Text(user.name),
                        );
                      }).toList(),
                    );
                  },
                ),
              ));
    }

    return BlocConsumer<TransferCubit, TransferState>(
      listener: (context, state) {
        if (state is TransferMoneySuccessState) {
          showSnakeBar(context, "Transfer Money Success");
          Navigator.pop(context);
          Navigator.pop(context);
        }
        if (state is TransferMoneyErrorState) {
          showSnakeBar(context, "Transfer Money Error");
        }
      },
      builder: (context, state) {
        var cubit = TransferCubit.get(context);
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
                    'Sender: ${sender.name}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Receiver: ${cubit.selectedReceiver!.name}', // ?? 'Select a receiver'
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              showSelectReceiverDialog();
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
                      final double amount = double.parse(amountController.text);
                      if (cubit.selectedReceiver == null ||
                          amountController.text.isEmpty) {
                        return 'Data is missing';
                      }
                      if (amount <= 0 || amount > sender.balance) {
                        return 'Invalid amount';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.transferMoney(
                              double.parse(amountController.text),
                              sender,
                              cubit.selectedReceiver!);
                        }
                      },
                      child: (state is TransferMoneyLoadingState)
                          ? const CircularProgressIndicator()
                          : const Text('Transfer Money'),
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

 */
  /*

  void _showSelectReceiverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            var cubit = AppCubit.get(context);

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
                items: cubit.customersForUser
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
*/
 

 