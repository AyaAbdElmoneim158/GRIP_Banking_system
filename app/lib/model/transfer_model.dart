// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Transfer {
  int id;
  int senderId;
  int receiverId;
  double amount;
  String senderName;
  String senderEmail;
  String receiverName;
  String receiverEmail;

  Transfer({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.amount,
    required this.senderName,
    required this.senderEmail,
    required this.receiverName,
    required this.receiverEmail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'amount': amount,
      'senderName': senderName,
      'senderEmail': senderEmail,
      'receiverName': receiverName,
      'receiverEmail': receiverEmail,
    };
  }

  factory Transfer.fromMap(Map<String, dynamic> map) {
    return Transfer(
      id: map['id'] as int,
      senderId: map['senderId'] as int,
      receiverId: map['receiverId'] as int,
      amount: map['amount'] as double,
      senderName: map['senderName'] as String,
      senderEmail: map['senderEmail'] as String,
      receiverName: map['receiverName'] as String,
      receiverEmail: map['receiverEmail'] as String,
    );
  }

  Transfer copyWith({
    int? id,
    int? senderId,
    int? receiverId,
    double? amount,
    String? senderName,
    String? senderEmail,
    String? receiverName,
    String? receiverEmail,
  }) {
    return Transfer(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      amount: amount ?? this.amount,
      senderName: senderName ?? this.senderName,
      senderEmail: senderEmail ?? this.senderEmail,
      receiverName: receiverName ?? this.receiverName,
      receiverEmail: receiverEmail ?? this.receiverEmail,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transfer.fromJson(String source) => Transfer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Transfer(id: $id, senderId: $senderId, receiverId: $receiverId, amount: $amount, senderName: $senderName, senderEmail: $senderEmail, receiverName: $receiverName, receiverEmail: $receiverEmail)';
  }

  @override
  bool operator ==(covariant Transfer other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.senderId == senderId &&
      other.receiverId == receiverId &&
      other.amount == amount &&
      other.senderName == senderName &&
      other.senderEmail == senderEmail &&
      other.receiverName == receiverName &&
      other.receiverEmail == receiverEmail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      senderId.hashCode ^
      receiverId.hashCode ^
      amount.hashCode ^
      senderName.hashCode ^
      senderEmail.hashCode ^
      receiverName.hashCode ^
      receiverEmail.hashCode;
  }
}
