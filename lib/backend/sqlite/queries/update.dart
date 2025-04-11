import 'package:sqflite/sqflite.dart';

/// BEGIN ADDDATA
Future performAdddata(
  Database database, {
  String? name,
  String? mobile,
}) {
  final query = '''
INSERT INTO Test (name, mobile) VALUES ('${name}', '${mobile}');
''';
  return database.rawQuery(query);
}

/// END ADDDATA

/// BEGIN UPDATE
Future performUpdate(
  Database database, {
  String? name,
  String? mobile,
}) {
  final query = '''
UPDATE Test
SET 
    name = '${name}',
    mobile = '${mobile}',
   
WHERE mobile = ${mobile};
''';
  return database.rawQuery(query);
}

/// END UPDATE

/// BEGIN DELETEDATA
Future performDeleteData(
  Database database, {
  String? mobile,
}) {
  final query = '''
DELETE FROM Test WHERE mobile = ${mobile};


''';
  return database.rawQuery(query);
}

/// END DELETEDATA
