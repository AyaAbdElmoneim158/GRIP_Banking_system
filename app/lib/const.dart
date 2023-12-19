import 'package:app/model/user_model.dart';
import 'package:flutter/material.dart';

List<User> dummyUsers = [
  User(
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    balance: 1000.0,
  ),
  User(
      id: 2,
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      balance: 1500.0),
  User(
      id: 3,
      name: 'Alice Johnson',
      email: 'alice.johnson@example.com',
      balance: 1200.0),
  User(
      id: 4,
      name: 'Bob Williams',
      email: 'bob.williams@example.com',
      balance: 800.0),
  User(
      id: 5,
      name: 'Eva Brown',
      email: 'eva.brown@example.com',
      balance: 2000.0),
  User(
      id: 6,
      name: 'Charlie Davis',
      email: 'charlie.davis@example.com',
      balance: 300.0),
  User(
      id: 7,
      name: 'Grace Miller',
      email: 'grace.miller@example.com',
      balance: 2500.0),
  User(
      id: 8,
      name: 'Daniel Wilson',
      email: 'daniel.wilson@example.com',
      balance: 1700.0),
  User(
      id: 9,
      name: 'Sophia Moore',
      email: 'sophia.moore@example.com',
      balance: 900.0),
  User(
      id: 10,
      name: 'Oliver Taylor',
      email: 'oliver.taylor@example.com',
      balance: 1800.0),
];

showSnakeBar(BuildContext context, String text) {
  SnackBar snackbar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
