import 'package:mysql_client/mysql_client.dart';
import 'package:workshop/models/Patient.dart';
import 'package:workshop/services/common/crud.dart';
import 'cabinet_dto.dart';

class PatientDto extends Crud {
  final String _table = 'patients';

  Future<BigInt> post(Patient patient, [MySQLConnection? connexion]) async {
    Map<String, dynamic> data = {
      'cabinet' : patient.cabinet.id,
      'firstName': patient.firstName,
      'lastName': patient.lastName,
      'maidenName': patient.maidenName,
      'birthDate': patient.birthDate.toString(),
      'address': patient.address,
      'notes': patient.notes,
      'createdAt': patient.createdAt.toString(),
    };
    return await super.create(_table, data, connexion);
  }

  Future<Patient?> getById(int id, [MySQLConnection? connexion]) async {
    IResultSet result = await super.read(_table, {'id': id}, connexion);
    Patient? patient;
    for (var element in result.rows){
      Map data = element.assoc();
      patient = Patient(
        id: int.parse(data['id']),
        cabinet: (await CabinetDto().getById(int.parse(data['cabinet']), connexion))!,
        firstName: data['firstName'],
        lastName: data['lastName'],
        maidenName: data['maidenName'],
        birthDate: DateTime.parse(data['birthDate']),
        address: data['address'],
        notes: data['notes'],
        createdAt: DateTime.parse(data['createdAt']),
      );
    }
    return patient;
  }

  Future<List<Patient>> getAll([MySQLConnection? connexion]) async {
    IResultSet result = await super.read(_table, {}, connexion);
    List<Patient> patients = [];
    for (var element in result.rows){
      Map data = element.assoc();
      patients.add(Patient(
        id: int.parse(data['id']),
        cabinet: (await CabinetDto().getById(int.parse(data['cabinet']), connexion))!,
        firstName: data['firstName'],
        lastName: data['lastName'],
        maidenName: data['maidenName'],
        birthDate: DateTime.parse(data['birthDate']),
        address: data['address'],
        notes: data['notes'],
        createdAt: DateTime.parse(data['createdAt']),
      ));
    }
    return patients;
  }

  Future<BigInt> put(Patient patient, [MySQLConnection? connexion]) async {
    Map<String, dynamic> data = {
      'cabinet': patient.cabinet.id,
      'firstName': patient.firstName,
      'lastName': patient.lastName,
      'maidenName': patient.maidenName,
      'birthDate': patient.birthDate.toString(),
      'address': patient.address,
      'notes': patient.notes,
      'createdAt': patient.createdAt.toString(),
    };
    return await super.update(_table, data, {'id': patient.id}, connexion);
  }

  Future<BigInt> destroy([Patient? patient, MySQLConnection? connexion]) async {
    return await super.delete(_table, {'id': patient!.id}, connexion);
  }
}