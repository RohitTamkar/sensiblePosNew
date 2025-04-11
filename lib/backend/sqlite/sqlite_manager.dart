import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'test_demo',
      'testDemo.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetRow>> get() => performGet(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future adddata({
    String? name,
    String? mobile,
  }) =>
      performAdddata(
        _database,
        name: name,
        mobile: mobile,
      );

  Future update({
    String? name,
    String? mobile,
  }) =>
      performUpdate(
        _database,
        name: name,
        mobile: mobile,
      );

  Future deleteData({
    String? mobile,
  }) =>
      performDeleteData(
        _database,
        mobile: mobile,
      );

  /// END UPDATE QUERY CALLS
}
