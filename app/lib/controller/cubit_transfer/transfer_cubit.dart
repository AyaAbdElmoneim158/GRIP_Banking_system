import 'package:app/const.dart';
import 'package:app/model/transfer_model.dart';
import 'package:app/model/user_model.dart';
import 'package:app/services/sqlite_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'transfer_state.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit() : super(TransferInitial());
  static TransferCubit get(context) => BlocProvider.of(context);
  final dbHelper = DatabaseHelper.instance;
  List<User> allUsers = []; //..GetAllUsers()..addUsersAtDB()..getAllTransfers()
  List<User> usersForSender = [];
  List<Transfer> allTransfers = [];
  List<Transfer> transfersForSender =
      []; //..GetTransfersForSender()~> When click at user to see Details
  late User user; //getUser()~> When click at user to see Details
  User? selectedReceiver;

  Future<void> addUsersAtDB() async {
    try {
      if (allUsers.isNotEmpty) {
        return;
      }
      emit(AddUsersAtDBLoadingState());
      await dbHelper.insertListOfUsers(dummyUsers);
      debugPrint("AddUsersAtDB Successfully");
      emit(AddUsersAtDBSuccessState());
    } catch (e) {
      debugPrint("AddUsersAtDB Failure");
      emit(AddUsersAtDBErrorState());
    }
  }

  Future<void> getAllUsers() async {
    try {
      emit(GetAllUsersLoadingState());
      allUsers = await dbHelper.getAllUsers();
      debugPrint("GetAllUsers Successfully");
      emit(GetAllUsersSuccessState());
    } catch (e) {
      debugPrint("GetAllUsers Failure");
      emit(GetAllUsersErrorState());
    }
  }

  Future<void> getUsersForSender(int id) async {
    try {
      emit(GetUsersForSenderLoadingState());
      var loadedUsers = await dbHelper.getAllUsers();
      usersForSender =
          loadedUsers.where((element) => (element.id != id)).toList();
      debugPrint("getUsersForSender Successfully");
      emit(GetUsersForSenderSuccessState());
    } catch (e) {
      debugPrint("getUsersForSender Failure");
      emit(GetUsersForSenderErrorState());
    }
  }

  Future<void> getUser(userId) async {
    try {
      emit(GetUserLoadingState());
      user = (await dbHelper.getUserById(userId))!;
      debugPrint("UpdateAmounts Successfully");
      emit(GetUserAmountsSuccessState());
    } catch (e) {
      debugPrint("UpdateAmounts Failure");
      emit(GetUserAmountsErrorState());
    }
  }

  Future<void> getAllTransfers() async {
    try {
      emit(GetAllTransfersLoadingState());
      allTransfers = await dbHelper.getAllTransfer();
      debugPrint("GetAllTransfers Successfully");
      emit(GetAllTransfersSuccessState());
    } catch (e) {
      debugPrint("GetAllTransfers Failure");
      emit(GetAllTransfersErrorState());
    }
  }

  Future<void> getTransfersForSender(int customerId) async {
    try {
      emit(GetTransfersForSenderLoadingState());
      var loadedTransfers = await dbHelper.getAllTransfer();
      transfersForSender = loadedTransfers
          .where((element) => (element.senderId == customerId))
          .toList();
      debugPrint("GetTransfersForSender Successfully");
      emit(GetTransfersForSenderSuccessState());
    } catch (e) {
      debugPrint("GetTransfersForSender Failure");
      emit(GetTransfersForSenderErrorState());
    }
  }

//----------------------------------------------------------
  Future<void> transferMoney(double amount, User sender, User receiver) async {
    try {
      emit(TransferMoneyLoadingState());
      Transfer transfer = Transfer(
        id: DateTime.now().millisecondsSinceEpoch,
        amount: amount,
        senderId: sender.id,
        receiverId: receiver.id,
        receiverEmail: receiver.email,
        receiverName: receiver.name,
        senderEmail: sender.email,
        senderName: sender.name,
      );
      await dbHelper.insertTransfer(transfer);
      updateAmounts(amount, sender, receiver);
      getAllUsers();
      getAllTransfers();
      getTransfersForSender(sender.id);
      debugPrint("TransferMoney Successfully: with amount $amount");
      emit(TransferMoneySuccessState());
    } catch (e) {
      debugPrint("TransferMoney Failure");
      emit(TransferMoneyErrorState());
    }
  }

  Future<void> updateAmounts(double amount, User sender, User receiver) async {
    try {
      emit(UpdateAmountsLoadingState());
      int isSenderUpdated = await dbHelper.updateUserBalance(
          sender.id, (sender.balance - amount));
      int isReceiverUpdated = await dbHelper.updateUserBalance(
          receiver.id, (receiver.balance + amount));
      debugPrint(
          "UpdateAmounts: isSenderUpdated....$isSenderUpdated  isReceiverUpdated....$isReceiverUpdated");
      getAllUsers();
      emit(UpdateAmountsSuccessState());
    } catch (e) {
      debugPrint("UpdateAmounts Failure");
      emit(UpdateAmountsErrorState());
    }
  }

  void onChanged(User? newValue, context) {
    selectedReceiver = newValue!;
    Navigator.of(context).pop();
  }
}
