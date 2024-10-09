import 'Cabinet.dart';

class Patient {
  int id;
  Cabinet cabinet;
  String firstName;
  String lastName;
  String? maidenName;
  DateTime birthDate;
  // pour avoir uniquement la date, on la formatera dans le frontend grâce au DTO.
  String address;
  String? notes;
  DateTime? createdAt = DateTime.now();

  Patient({
    required this.id,
    required this.cabinet,
    required this.firstName,
    required this.lastName,
    this.maidenName,
    required this.birthDate,
    required this.address,
    this.notes,
    this.createdAt,
  });

  @override
  String toString() {
    return 'Patient{patient_id: $id, cabinet_id: $cabinet, first_name: $firstName, last_name: $lastName, maiden_name: $maidenName, address: $address, notes: $notes, created_at: $createdAt}';
  }
}