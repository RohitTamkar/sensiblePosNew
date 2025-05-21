import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TableKotRecord extends FirestoreRecord {
  TableKotRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "discountAmt" field.
  double? _discountAmt;
  double get discountAmt => _discountAmt ?? 0.0;
  bool hasDiscountAmt() => _discountAmt != null;

  // "discountPer" field.
  double? _discountPer;
  double get discountPer => _discountPer ?? 0.0;
  bool hasDiscountPer() => _discountPer != null;

  // "delliveryChrg" field.
  double? _delliveryChrg;
  double get delliveryChrg => _delliveryChrg ?? 0.0;
  bool hasDelliveryChrg() => _delliveryChrg != null;

  // "taxAmt" field.
  double? _taxAmt;
  double get taxAmt => _taxAmt ?? 0.0;
  bool hasTaxAmt() => _taxAmt != null;

  // "billAmt" field.
  double? _billAmt;
  double get billAmt => _billAmt ?? 0.0;
  bool hasBillAmt() => _billAmt != null;

  // "finalBillAmt" field.
  double? _finalBillAmt;
  double get finalBillAmt => _finalBillAmt ?? 0.0;
  bool hasFinalBillAmt() => _finalBillAmt != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "updatedDate" field.
  int? _updatedDate;
  int get updatedDate => _updatedDate ?? 0;
  bool hasUpdatedDate() => _updatedDate != null;

  // "productList" field.
  List<SelItemListStruct>? _productList;
  List<SelItemListStruct> get productList => _productList ?? const [];
  bool hasProductList() => _productList != null;

  // "taxPer" field.
  double? _taxPer;
  double get taxPer => _taxPer ?? 0.0;
  bool hasTaxPer() => _taxPer != null;

  // "checkInTime" field.
  int? _checkInTime;
  int get checkInTime => _checkInTime ?? 0;
  bool hasCheckInTime() => _checkInTime != null;

  // "checkOutTime" field.
  int? _checkOutTime;
  int get checkOutTime => _checkOutTime ?? 0;
  bool hasCheckOutTime() => _checkOutTime != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  bool hasDuration() => _duration != null;

  // "orderType" field.
  String? _orderType;
  String get orderType => _orderType ?? '';
  bool hasOrderType() => _orderType != null;

  // "kotStatus" field.
  String? _kotStatus;
  String get kotStatus => _kotStatus ?? '';
  bool hasKotStatus() => _kotStatus != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "table" field.
  String? _table;
  String get table => _table ?? '';
  bool hasTable() => _table != null;

  // "settled" field.
  bool? _settled;
  bool get settled => _settled ?? false;
  bool hasSettled() => _settled != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _dayId = snapshotData['dayId'] as String?;
    _discountAmt = castToType<double>(snapshotData['discountAmt']);
    _discountPer = castToType<double>(snapshotData['discountPer']);
    _delliveryChrg = castToType<double>(snapshotData['delliveryChrg']);
    _taxAmt = castToType<double>(snapshotData['taxAmt']);
    _billAmt = castToType<double>(snapshotData['billAmt']);
    _finalBillAmt = castToType<double>(snapshotData['finalBillAmt']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _updatedDate = castToType<int>(snapshotData['updatedDate']);
    _productList = getStructList(
      snapshotData['productList'],
      SelItemListStruct.fromMap,
    );
    _taxPer = castToType<double>(snapshotData['taxPer']);
    _checkInTime = castToType<int>(snapshotData['checkInTime']);
    _checkOutTime = castToType<int>(snapshotData['checkOutTime']);
    _count = castToType<int>(snapshotData['count']);
    _duration = castToType<double>(snapshotData['duration']);
    _orderType = snapshotData['orderType'] as String?;
    _kotStatus = snapshotData['kotStatus'] as String?;
    _source = snapshotData['source'] as String?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _table = snapshotData['table'] as String?;
    _settled = snapshotData['settled'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('TABLE_KOT')
          : FirebaseFirestore.instance.collectionGroup('TABLE_KOT');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('TABLE_KOT').doc(id);

  static Stream<TableKotRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TableKotRecord.fromSnapshot(s));

  static Future<TableKotRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TableKotRecord.fromSnapshot(s));

  static TableKotRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TableKotRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TableKotRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TableKotRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TableKotRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TableKotRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTableKotRecordData({
  String? id,
  String? dayId,
  double? discountAmt,
  double? discountPer,
  double? delliveryChrg,
  double? taxAmt,
  double? billAmt,
  double? finalBillAmt,
  DocumentReference? createdBy,
  int? createdDate,
  int? updatedDate,
  double? taxPer,
  int? checkInTime,
  int? checkOutTime,
  int? count,
  double? duration,
  String? orderType,
  String? kotStatus,
  String? source,
  bool? isDeleted,
  String? table,
  bool? settled,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'dayId': dayId,
      'discountAmt': discountAmt,
      'discountPer': discountPer,
      'delliveryChrg': delliveryChrg,
      'taxAmt': taxAmt,
      'billAmt': billAmt,
      'finalBillAmt': finalBillAmt,
      'createdBy': createdBy,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'taxPer': taxPer,
      'checkInTime': checkInTime,
      'checkOutTime': checkOutTime,
      'count': count,
      'duration': duration,
      'orderType': orderType,
      'kotStatus': kotStatus,
      'source': source,
      'isDeleted': isDeleted,
      'table': table,
      'settled': settled,
    }.withoutNulls,
  );

  return firestoreData;
}

class TableKotRecordDocumentEquality implements Equality<TableKotRecord> {
  const TableKotRecordDocumentEquality();

  @override
  bool equals(TableKotRecord? e1, TableKotRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.dayId == e2?.dayId &&
        e1?.discountAmt == e2?.discountAmt &&
        e1?.discountPer == e2?.discountPer &&
        e1?.delliveryChrg == e2?.delliveryChrg &&
        e1?.taxAmt == e2?.taxAmt &&
        e1?.billAmt == e2?.billAmt &&
        e1?.finalBillAmt == e2?.finalBillAmt &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdDate == e2?.createdDate &&
        e1?.updatedDate == e2?.updatedDate &&
        listEquality.equals(e1?.productList, e2?.productList) &&
        e1?.taxPer == e2?.taxPer &&
        e1?.checkInTime == e2?.checkInTime &&
        e1?.checkOutTime == e2?.checkOutTime &&
        e1?.count == e2?.count &&
        e1?.duration == e2?.duration &&
        e1?.orderType == e2?.orderType &&
        e1?.kotStatus == e2?.kotStatus &&
        e1?.source == e2?.source &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.table == e2?.table &&
        e1?.settled == e2?.settled;
  }

  @override
  int hash(TableKotRecord? e) => const ListEquality().hash([
        e?.id,
        e?.dayId,
        e?.discountAmt,
        e?.discountPer,
        e?.delliveryChrg,
        e?.taxAmt,
        e?.billAmt,
        e?.finalBillAmt,
        e?.createdBy,
        e?.createdDate,
        e?.updatedDate,
        e?.productList,
        e?.taxPer,
        e?.checkInTime,
        e?.checkOutTime,
        e?.count,
        e?.duration,
        e?.orderType,
        e?.kotStatus,
        e?.source,
        e?.isDeleted,
        e?.table,
        e?.settled
      ]);

  @override
  bool isValidKey(Object? o) => o is TableKotRecord;
}
