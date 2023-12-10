class TransferModel {
  int? transactionID;
  int? ownerID;
  String? fromAccount;
  String? toAccount;
  String? transactionDate;
  double? amount;

  TransferModel(
      {transactionID,
      ownerID,
      fromAccount,
      toAccount,
      transactionDate,
      amount});

  TransferModel.fromJson(Map<String, dynamic> json) {
    transactionID = json['transactionID'];
    ownerID = json['ownerID'];
    fromAccount = json['fromAccount'];
    toAccount = json['toAccount'];
    transactionDate = json['transactionDate'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['transactionID'] = transactionID;
    data['ownerID'] = ownerID;
    data['fromAccount'] = fromAccount;
    data['toAccount'] = toAccount;
    data['transactionDate'] = transactionDate;
    data['amount'] = amount;
    return data;
  }
}
