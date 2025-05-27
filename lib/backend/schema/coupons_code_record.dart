import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CouponsCodeRecord extends FirestoreRecord {
  CouponsCodeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "couponCode" field.
  String? _couponCode;
  String get couponCode => _couponCode ?? '';
  bool hasCouponCode() => _couponCode != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "maxAmtDiscount" field.
  double? _maxAmtDiscount;
  double get maxAmtDiscount => _maxAmtDiscount ?? 0.0;
  bool hasMaxAmtDiscount() => _maxAmtDiscount != null;

  // "percentageDiscount" field.
  double? _percentageDiscount;
  double get percentageDiscount => _percentageDiscount ?? 0.0;
  bool hasPercentageDiscount() => _percentageDiscount != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _couponCode = snapshotData['couponCode'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _maxAmtDiscount = castToType<double>(snapshotData['maxAmtDiscount']);
    _percentageDiscount =
        castToType<double>(snapshotData['percentageDiscount']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('COUPONS_CODE')
          : FirebaseFirestore.instance.collectionGroup('COUPONS_CODE');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('COUPONS_CODE').doc(id);

  static Stream<CouponsCodeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CouponsCodeRecord.fromSnapshot(s));

  static Future<CouponsCodeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CouponsCodeRecord.fromSnapshot(s));

  static CouponsCodeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CouponsCodeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CouponsCodeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CouponsCodeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CouponsCodeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CouponsCodeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCouponsCodeRecordData({
  String? id,
  String? couponCode,
  bool? isActive,
  double? maxAmtDiscount,
  double? percentageDiscount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'couponCode': couponCode,
      'isActive': isActive,
      'maxAmtDiscount': maxAmtDiscount,
      'percentageDiscount': percentageDiscount,
    }.withoutNulls,
  );

  return firestoreData;
}

class CouponsCodeRecordDocumentEquality implements Equality<CouponsCodeRecord> {
  const CouponsCodeRecordDocumentEquality();

  @override
  bool equals(CouponsCodeRecord? e1, CouponsCodeRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.couponCode == e2?.couponCode &&
        e1?.isActive == e2?.isActive &&
        e1?.maxAmtDiscount == e2?.maxAmtDiscount &&
        e1?.percentageDiscount == e2?.percentageDiscount;
  }

  @override
  int hash(CouponsCodeRecord? e) => const ListEquality().hash([
        e?.id,
        e?.couponCode,
        e?.isActive,
        e?.maxAmtDiscount,
        e?.percentageDiscount
      ]);

  @override
  bool isValidKey(Object? o) => o is CouponsCodeRecord;
}
