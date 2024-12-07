import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LandmarksRecord extends FirestoreRecord {
  LandmarksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _description = snapshotData['Description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('landmarks');

  static Stream<LandmarksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LandmarksRecord.fromSnapshot(s));

  static Future<LandmarksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LandmarksRecord.fromSnapshot(s));

  static LandmarksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LandmarksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LandmarksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LandmarksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LandmarksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LandmarksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLandmarksRecordData({
  String? name,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class LandmarksRecordDocumentEquality implements Equality<LandmarksRecord> {
  const LandmarksRecordDocumentEquality();

  @override
  bool equals(LandmarksRecord? e1, LandmarksRecord? e2) {
    return e1?.name == e2?.name && e1?.description == e2?.description;
  }

  @override
  int hash(LandmarksRecord? e) =>
      const ListEquality().hash([e?.name, e?.description]);

  @override
  bool isValidKey(Object? o) => o is LandmarksRecord;
}
