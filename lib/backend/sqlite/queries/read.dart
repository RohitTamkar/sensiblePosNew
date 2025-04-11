import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GET
Future<List<GetRow>> performGet(
  Database database,
) {
  final query = '''
SELECT * FROM Test;
''';
  return _readQuery(database, query, (d) => GetRow(d));
}

class GetRow extends SqliteRow {
  GetRow(Map<String, dynamic> data) : super(data);

  String get name => data['name'] as String;
  String get mobile => data['mobile'] as String;
}

/// END GET
