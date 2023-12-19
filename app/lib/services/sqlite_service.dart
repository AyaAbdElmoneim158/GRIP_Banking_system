import 'package:app/model/transfer_model.dart';
import 'package:app/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'money_transfer.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        balance REAL
      );
    ''');

    await db.execute('''
      CREATE TABLE transfers(
        id INTEGER PRIMARY KEY,
        senderId INTEGER,
        receiverId INTEGER,
        amount REAL,
        senderName TEXT,
        senderEmail TEXT,
        receiverName TEXT,
        receiverEmail TEXT
      );
    ''');
  }

  Future<List<User>> getAllUsers() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        balance: maps[i]['balance'],
      );
    });
  }

  Future<List<Transfer>> getAllTransfer() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('transfers');

    return List.generate(maps.length, (i) {
      return Transfer(
        id: maps[i]['id'],
        senderId: maps[i]['senderId'],
        receiverId: maps[i]['receiverId'],
        amount: maps[i]['amount'],
        senderName: maps[i]['senderName'],
        senderEmail: maps[i]['senderEmail'],
        receiverName: maps[i]['receiverName'],
        receiverEmail: maps[i]['receiverEmail'],
      );
    });
  }

  Future<List<Map<String, dynamic>>> getAllTransfersForSender(
      int senderId) async {
    final Database db = await database;

    return await db.query(
      'transfers',
      where: 'sender_id = ?',
      whereArgs: [senderId],
    );
  }

  Future<User?> getUserById(int userId) async {
    final Database db = await database;

    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
    );

    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    } else {
      return null; // User not found
    }
  }

  Future<void> insertTransfer(Transfer transfer) async {
    final Database db = await database;
    await db.insert(
      'transfers',
      transfer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertUser(User user) async {
    final Database db = await database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertListOfUsers(List<User> users) async {
    final Database db = await database;

    Batch batch = db.batch();

    for (User user in users) {
      batch.insert('users', user.toMap());
    }

    await batch.commit();
  }

  Future<int> updateUserBalance(int userId, double newBalance) async {
    final Database db = await database;

    return await db.update(
      'users',
      {'balance': newBalance},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }
}
