// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipeItemListStruct extends FFFirebaseStruct {
  RecipeItemListStruct({
    String? name,
    double? price,
    double? quantity,
    String? id,
    double? taxPer,
    double? taxAmt,
    double? total,
    String? taxId,
    String? catId,
    int? currentStock,
    bool? stockable,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _price = price,
        _quantity = quantity,
        _id = id,
        _taxPer = taxPer,
        _taxAmt = taxAmt,
        _total = total,
        _taxId = taxId,
        _catId = catId,
        _currentStock = currentStock,
        _stockable = stockable,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  set quantity(double? val) => _quantity = val;

  void incrementQuantity(double amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "taxPer" field.
  double? _taxPer;
  double get taxPer => _taxPer ?? 0.0;
  set taxPer(double? val) => _taxPer = val;

  void incrementTaxPer(double amount) => taxPer = taxPer + amount;

  bool hasTaxPer() => _taxPer != null;

  // "taxAmt" field.
  double? _taxAmt;
  double get taxAmt => _taxAmt ?? 0.0;
  set taxAmt(double? val) => _taxAmt = val;

  void incrementTaxAmt(double amount) => taxAmt = taxAmt + amount;

  bool hasTaxAmt() => _taxAmt != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "taxId" field.
  String? _taxId;
  String get taxId => _taxId ?? '';
  set taxId(String? val) => _taxId = val;

  bool hasTaxId() => _taxId != null;

  // "catId" field.
  String? _catId;
  String get catId => _catId ?? '';
  set catId(String? val) => _catId = val;

  bool hasCatId() => _catId != null;

  // "currentStock" field.
  int? _currentStock;
  int get currentStock => _currentStock ?? 0;
  set currentStock(int? val) => _currentStock = val;

  void incrementCurrentStock(int amount) =>
      currentStock = currentStock + amount;

  bool hasCurrentStock() => _currentStock != null;

  // "stockable" field.
  bool? _stockable;
  bool get stockable => _stockable ?? false;
  set stockable(bool? val) => _stockable = val;

  bool hasStockable() => _stockable != null;

  static RecipeItemListStruct fromMap(Map<String, dynamic> data) =>
      RecipeItemListStruct(
        name: data['name'] as String?,
        price: castToType<double>(data['price']),
        quantity: castToType<double>(data['quantity']),
        id: data['id'] as String?,
        taxPer: castToType<double>(data['taxPer']),
        taxAmt: castToType<double>(data['taxAmt']),
        total: castToType<double>(data['total']),
        taxId: data['taxId'] as String?,
        catId: data['catId'] as String?,
        currentStock: castToType<int>(data['currentStock']),
        stockable: data['stockable'] as bool?,
      );

  static RecipeItemListStruct? maybeFromMap(dynamic data) => data is Map
      ? RecipeItemListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'price': _price,
        'quantity': _quantity,
        'id': _id,
        'taxPer': _taxPer,
        'taxAmt': _taxAmt,
        'total': _total,
        'taxId': _taxId,
        'catId': _catId,
        'currentStock': _currentStock,
        'stockable': _stockable,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.double,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'taxPer': serializeParam(
          _taxPer,
          ParamType.double,
        ),
        'taxAmt': serializeParam(
          _taxAmt,
          ParamType.double,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'taxId': serializeParam(
          _taxId,
          ParamType.String,
        ),
        'catId': serializeParam(
          _catId,
          ParamType.String,
        ),
        'currentStock': serializeParam(
          _currentStock,
          ParamType.int,
        ),
        'stockable': serializeParam(
          _stockable,
          ParamType.bool,
        ),
      }.withoutNulls;

  static RecipeItemListStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecipeItemListStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.double,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        taxPer: deserializeParam(
          data['taxPer'],
          ParamType.double,
          false,
        ),
        taxAmt: deserializeParam(
          data['taxAmt'],
          ParamType.double,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        taxId: deserializeParam(
          data['taxId'],
          ParamType.String,
          false,
        ),
        catId: deserializeParam(
          data['catId'],
          ParamType.String,
          false,
        ),
        currentStock: deserializeParam(
          data['currentStock'],
          ParamType.int,
          false,
        ),
        stockable: deserializeParam(
          data['stockable'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'RecipeItemListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecipeItemListStruct &&
        name == other.name &&
        price == other.price &&
        quantity == other.quantity &&
        id == other.id &&
        taxPer == other.taxPer &&
        taxAmt == other.taxAmt &&
        total == other.total &&
        taxId == other.taxId &&
        catId == other.catId &&
        currentStock == other.currentStock &&
        stockable == other.stockable;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        price,
        quantity,
        id,
        taxPer,
        taxAmt,
        total,
        taxId,
        catId,
        currentStock,
        stockable
      ]);
}

RecipeItemListStruct createRecipeItemListStruct({
  String? name,
  double? price,
  double? quantity,
  String? id,
  double? taxPer,
  double? taxAmt,
  double? total,
  String? taxId,
  String? catId,
  int? currentStock,
  bool? stockable,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecipeItemListStruct(
      name: name,
      price: price,
      quantity: quantity,
      id: id,
      taxPer: taxPer,
      taxAmt: taxAmt,
      total: total,
      taxId: taxId,
      catId: catId,
      currentStock: currentStock,
      stockable: stockable,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RecipeItemListStruct? updateRecipeItemListStruct(
  RecipeItemListStruct? recipeItemList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    recipeItemList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRecipeItemListStructData(
  Map<String, dynamic> firestoreData,
  RecipeItemListStruct? recipeItemList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (recipeItemList == null) {
    return;
  }
  if (recipeItemList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && recipeItemList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final recipeItemListData =
      getRecipeItemListFirestoreData(recipeItemList, forFieldValue);
  final nestedData =
      recipeItemListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = recipeItemList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRecipeItemListFirestoreData(
  RecipeItemListStruct? recipeItemList, [
  bool forFieldValue = false,
]) {
  if (recipeItemList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(recipeItemList.toMap());

  // Add any Firestore field values
  recipeItemList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRecipeItemListListFirestoreData(
  List<RecipeItemListStruct>? recipeItemLists,
) =>
    recipeItemLists
        ?.map((e) => getRecipeItemListFirestoreData(e, true))
        .toList() ??
    [];
