class User {
  int id;
  String name;
  String email;
  double balance;

  User({required this.id, required this.name, required this.email, required this.balance});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'balance': balance,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      balance: map['balance'],
    );
  }
}
