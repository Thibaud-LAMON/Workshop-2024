import 'Cabinet.dart';

class User {
  int? id;
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
    return 'User{user_id: $id, name: $name, email: $email, password_hash: $password, cabinet_id: $cabinet, created_at: $createdAt}';
  }
}