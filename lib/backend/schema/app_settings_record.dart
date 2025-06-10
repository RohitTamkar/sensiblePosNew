import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppSettingsRecord extends FirestoreRecord {
  AppSettingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "deviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  bool hasDeviceId() => _deviceId != null;

  // "settingList" field.
  List<AppSettingsStruct>? _settingList;
  List<AppSettingsStruct> get settingList => _settingList ?? const [];
  bool hasSettingList() => _settingList != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _deviceId = snapshotData['deviceId'] as String?;
    _settingList = getStructList(
      snapshotData['settingList'],
      AppSettingsStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('APP_SETTINGS')
          : FirebaseFirestore.instance.collectionGroup('APP_SETTINGS');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('APP_SETTINGS').doc(id);

  static Stream<AppSettingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppSettingsRecord.fromSnapshot(s));

  static Future<AppSettingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppSettingsRecord.fromSnapshot(s));

  static AppSettingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppSettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppSettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppSettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppSettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppSettingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppSettingsRecordData({
  String? deviceId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'deviceId': deviceId,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppSettingsRecordDocumentEquality implements Equality<AppSettingsRecord> {
  const AppSettingsRecordDocumentEquality();

  @override
  bool equals(AppSettingsRecord? e1, AppSettingsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.deviceId == e2?.deviceId &&
        listEquality.equals(e1?.settingList, e2?.settingList);
  }

  @override
  int hash(AppSettingsRecord? e) =>
      const ListEquality().hash([e?.deviceId, e?.settingList]);

  @override
  bool isValidKey(Object? o) => o is AppSettingsRecord;
}
