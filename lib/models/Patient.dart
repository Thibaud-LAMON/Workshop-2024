import 'Cabinet.dart';

class Patient {
  int? id;
  Cabinet? cabinet;
  String name;
  String address;
  String notes;
  DateTime? createdAt;

  Patient({
    this.id,
    this.cabinet,
    required this.name,
    required this.address,
    required this.notes,
    this.createdAt,
  });

  @override
  String toString() {
    return 'Patient{patientId: $id, cabinetId: $cabinet, name: $name, address: $address, notes: $notes, createdAt: $createdAt}';
  }
}