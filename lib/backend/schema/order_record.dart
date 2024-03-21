import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "cart" field.
  DocumentReference? _cart;
  DocumentReference? get cart => _cart;
  bool hasCart() => _cart != null;

  // "selectedItems" field.
  List<DocumentReference>? _selectedItems;
  List<DocumentReference> get selectedItems => _selectedItems ?? const [];
  bool hasSelectedItems() => _selectedItems != null;

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "numero" field.
  int? _numero;
  int get numero => _numero ?? 0;
  bool hasNumero() => _numero != null;

  // "DNI" field.
  int? _dni;
  int get dni => _dni ?? 0;
  bool hasDni() => _dni != null;

  // "Direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "Referencias" field.
  String? _referencias;
  String get referencias => _referencias ?? '';
  bool hasReferencias() => _referencias != null;

  // "Ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  // "Pago" field.
  String? _pago;
  String get pago => _pago ?? '';
  bool hasPago() => _pago != null;

  // "Cupon" field.
  String? _cupon;
  String get cupon => _cupon ?? '';
  bool hasCupon() => _cupon != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _creator = snapshotData['creator'] as DocumentReference?;
    _cart = snapshotData['cart'] as DocumentReference?;
    _selectedItems = getDataList(snapshotData['selectedItems']);
    _nombre = snapshotData['Nombre'] as String?;
    _numero = castToType<int>(snapshotData['numero']);
    _dni = castToType<int>(snapshotData['DNI']);
    _direccion = snapshotData['Direccion'] as String?;
    _referencias = snapshotData['Referencias'] as String?;
    _ciudad = snapshotData['Ciudad'] as String?;
    _pago = snapshotData['Pago'] as String?;
    _cupon = snapshotData['Cupon'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  String? name,
  double? amount,
  String? status,
  DateTime? createdAt,
  DocumentReference? creator,
  DocumentReference? cart,
  String? nombre,
  int? numero,
  int? dni,
  String? direccion,
  String? referencias,
  String? ciudad,
  String? pago,
  String? cupon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'amount': amount,
      'status': status,
      'created_at': createdAt,
      'creator': creator,
      'cart': cart,
      'Nombre': nombre,
      'numero': numero,
      'DNI': dni,
      'Direccion': direccion,
      'Referencias': referencias,
      'Ciudad': ciudad,
      'Pago': pago,
      'Cupon': cupon,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.amount == e2?.amount &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.creator == e2?.creator &&
        e1?.cart == e2?.cart &&
        listEquality.equals(e1?.selectedItems, e2?.selectedItems) &&
        e1?.nombre == e2?.nombre &&
        e1?.numero == e2?.numero &&
        e1?.dni == e2?.dni &&
        e1?.direccion == e2?.direccion &&
        e1?.referencias == e2?.referencias &&
        e1?.ciudad == e2?.ciudad &&
        e1?.pago == e2?.pago &&
        e1?.cupon == e2?.cupon;
  }

  @override
  int hash(OrderRecord? e) => const ListEquality().hash([
        e?.name,
        e?.amount,
        e?.status,
        e?.createdAt,
        e?.creator,
        e?.cart,
        e?.selectedItems,
        e?.nombre,
        e?.numero,
        e?.dni,
        e?.direccion,
        e?.referencias,
        e?.ciudad,
        e?.pago,
        e?.cupon
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
