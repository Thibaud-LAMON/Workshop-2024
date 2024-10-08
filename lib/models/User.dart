import 'Cabinet.dart';

class User {
  int? id;
  String name;
  String email;
  String password;
  Cabinet? cabinet;
  DateTime createdAt;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.cabinet,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'User{userId: $id, name: $name, email: $email, password: $password, cabinetId: $cabinet, createdAt: $createdAt}';
  }
}