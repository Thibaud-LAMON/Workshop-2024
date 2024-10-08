import 'Cabinet.dart';

class Patient {
  int id;
  Cabinet cabinet;
  String name;
  String address;
  String? notes;
  DateTime? createdAt = DateTime.now();

  Patient({
    required this.id,
    required this.cabinet,
    required this.name,
    required this.address,
    this.notes,
    this.createdAt,
  });

  @override
  String toString() {
    return 'Patient{patientId: $id, cabinetId: $cabinet, name: $name, address: $address, notes: $notes, createdAt: $createdAt}';
  }
}