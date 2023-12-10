//https://stackoverflow.com/questions/9488612/bank-transactions-table-can-this-be-done-better
import 'package:uuid/uuid.dart';

class UserModel {
  String? userId; //ToDo: int
  String? userName;
  String? userEmail;
  double? userCurrentBalance;

  UserModel({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userCurrentBalance,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] ?? '';
    userName = json['userName'] ?? '';
    userEmail = json['userEmail'] ?? '';
    userCurrentBalance = json['userCurrentBalance'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userName'] = userName;
    data['userEmail'] = userEmail;
    data['userCurrentBalance'] = userCurrentBalance;
    return data;
  }

  static List<UserModel> dummyUser = [
    UserModel(
      userId: const Uuid().v1(),
      userCurrentBalance: 13000,
      userEmail: "Aya32hdj@gmail.com",
      userName: "Aya Abdelmoneim",
    ),
  ];
}
