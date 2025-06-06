import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipeRecord extends FirestoreRecord {
  RecipeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "reverseStock" field.
  bool? _reverseStock;
  bool get reverseStock => _reverseStock ?? false;
  bool hasReverseStock() => _reverseStock != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "items" field.
  List<RecipeItemListStruct>? _items;
  List<RecipeItemListStruct> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _reverseStock = snapshotData['reverseStock'] as bool?;
    _type = castToType<int>(snapshotData['type']);
    _code = castToType<int>(snapshotData['code']);
    _items = getStructList(
      snapshotData['items'],
      RecipeItemListStruct.fromMap,
    );
    _id = snapshotData['id'] as String?;
    _productId = snapshotData['productId'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('RECIPE')
          : FirebaseFirestore.instance.collectionGroup('RECIPE');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('RECIPE').doc(id);

  static Stream<RecipeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecipeRecord.fromSnapshot(s));

  static Future<RecipeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecipeRecord.fromSnapshot(s));

  static RecipeRecord fromSnapshot(DocumentSnapshot snapshot) => RecipeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecipeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecipeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecipeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecipeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecipeRecordData({
  String? name,
  bool? reverseStock,
  int? type,
  int? code,
  String? id,
  String? productId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'reverseStock': reverseStock,
      'type': type,
      'code': code,
      'id': id,
      'productId': productId,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecipeRecordDocumentEquality implements Equality<RecipeRecord> {
  const RecipeRecordDocumentEquality();

  @override
  bool equals(RecipeRecord? e1, RecipeRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.reverseStock == e2?.reverseStock &&
        e1?.type == e2?.type &&
        e1?.code == e2?.code &&
        listEquality.equals(e1?.items, e2?.items) &&
        e1?.id == e2?.id &&
        e1?.productId == e2?.productId;
  }

  @override
  int hash(RecipeRecord? e) => const ListEquality().hash([
        e?.name,
        e?.reverseStock,
        e?.type,
        e?.code,
        e?.items,
        e?.id,
        e?.productId
      ]);

  @override
  bool isValidKey(Object? o) => o is RecipeRecord;
}
