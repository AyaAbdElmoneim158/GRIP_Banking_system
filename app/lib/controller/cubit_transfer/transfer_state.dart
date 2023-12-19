part of 'transfer_cubit.dart';

abstract class TransferState extends Equatable {
  const TransferState();
  @override
  List<Object> get props => [];
}

final class TransferInitial extends TransferState {}

final class GetAllUsersLoadingState extends TransferState {}

final class GetAllUsersErrorState extends TransferState {}

final class GetAllUsersSuccessState extends TransferState {}

final class AddUsersAtDBLoadingState extends TransferState {}

final class AddUsersAtDBErrorState extends TransferState {}

final class AddUsersAtDBSuccessState extends TransferState {}

final class GetAllTransfersLoadingState extends TransferState {}

final class GetAllTransfersErrorState extends TransferState {}

final class GetAllTransfersSuccessState extends TransferState {}

final class GetTransfersForSenderLoadingState extends TransferState {}

final class GetTransfersForSenderErrorState extends TransferState {}

final class GetTransfersForSenderSuccessState extends TransferState {}

final class GetUsersForSenderLoadingState extends TransferState {}

final class GetUsersForSenderErrorState extends TransferState {}

final class GetUsersForSenderSuccessState extends TransferState {}

final class TransferMoneyLoadingState extends TransferState {}

final class TransferMoneyErrorState extends TransferState {}

final class TransferMoneySuccessState extends TransferState {}

final class UpdateAmountsLoadingState extends TransferState {}

final class UpdateAmountsErrorState extends TransferState {}

final class UpdateAmountsSuccessState extends TransferState {}

final class GetUserLoadingState extends TransferState {}

final class GetUserAmountsErrorState extends TransferState {}

final class GetUserAmountsSuccessState extends TransferState {}



