import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StockSummaryRecord extends FirestoreRecord {
  StockSummaryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "monthId" field.
  String? _monthId;
  String get monthId => _monthId ?? '';
  bool hasMonthId() => _monthId != null;

  // "updatedBy" field.
  String? _updatedBy;
  String get updatedBy => _updatedBy ?? '';
  bool hasUpdatedBy() => _updatedBy != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _createdBy = snapshotData['createdBy'] as String?;
    _status = snapshotData['status'] as String?;
    _dayId = snapshotData['dayId'] as String?;
    _monthId = snapshotData['monthId'] as String?;
    _updatedBy = snapshotData['updatedBy'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('STOCK_SUMMARY')
          : FirebaseFirestore.instance.collectionGroup('STOCK_SUMMARY');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('STOCK_SUMMARY').doc(id);

  static Stream<StockSummaryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StockSummaryRecord.fromSnapshot(s));

  static Future<StockSummaryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StockSummaryRecord.fromSnapshot(s));

  static StockSummaryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StockSummaryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StockSummaryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StockSummaryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StockSummaryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StockSummaryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStockSummaryRecordData({
  String? id,
  String? createdBy,
  String? status,
  String? dayId,
  String? monthId,
  String? updatedBy,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'createdBy': createdBy,
      'status': status,
      'dayId': dayId,
      'monthId': monthId,
      'updatedBy': updatedBy,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class StockSummaryRecordDocumentEquality
    implements Equality<StockSummaryRecord> {
  const StockSummaryRecordDocumentEquality();

  @override
  bool equals(StockSummaryRecord? e1, StockSummaryRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.createdBy == e2?.createdBy &&
        e1?.status == e2?.status &&
        e1?.dayId == e2?.dayId &&
        e1?.monthId == e2?.monthId &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(StockSummaryRecord? e) => const ListEquality().hash([
        e?.id,
        e?.createdBy,
        e?.status,
        e?.dayId,
        e?.monthId,
        e?.updatedBy,
        e?.createdAt,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is StockSummaryRecord;
}
