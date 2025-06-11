import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TableJsonRecord extends FirestoreRecord {
  TableJsonRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tableJson" field.
  String? _tableJson;
  String get tableJson => _tableJson ?? '';
  bool hasTableJson() => _tableJson != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tableJson = snapshotData['tableJson'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('TABLE_JSON')
          : FirebaseFirestore.instance.collectionGroup('TABLE_JSON');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('TABLE_JSON').doc(id);

  static Stream<TableJsonRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TableJsonRecord.fromSnapshot(s));

  static Future<TableJsonRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TableJsonRecord.fromSnapshot(s));

  static TableJsonRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TableJsonRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TableJsonRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TableJsonRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TableJsonRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TableJsonRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTableJsonRecordData({
  String? tableJson,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tableJson': tableJson,
    }.withoutNulls,
  );

  return firestoreData;
}

class TableJsonRecordDocumentEquality implements Equality<TableJsonRecord> {
  const TableJsonRecordDocumentEquality();

  @override
  bool equals(TableJsonRecord? e1, TableJsonRecord? e2) {
    return e1?.tableJson == e2?.tableJson;
  }

  @override
  int hash(TableJsonRecord? e) => const ListEquality().hash([e?.tableJson]);

  @override
  bool isValidKey(Object? o) => o is TableJsonRecord;
}
