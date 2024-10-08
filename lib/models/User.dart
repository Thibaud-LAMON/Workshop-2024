import 'Cabinet.dart';

class User {
  int id;
  String name;
  String email;
  String password;
  Cabinet? cabinet;
  DateTime? createdAt = DateTime.now();

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.cabinet,
    this.createdAt,
  });

  @override
  String toString() {
    return 'User{userId: $id, name: $name, email: $email, password: $password, cabinetId: $cabinet, createdAt: $createdAt}';
  }
}