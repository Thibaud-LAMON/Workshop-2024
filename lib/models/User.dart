import 'Cabinet.dart';

class User {
  int? userId;
  String name;
  String email;
  String password;
  Cabinet? cabinetId;
  DateTime createdAt;

  User({
    this.userId,
    required this.name,
    required this.email,
    required this.password,
    this.cabinetId,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'User{userId: $userId, name: $name, email: $email, password: $password, cabinetId: $cabinetId, createdAt: $createdAt}';
  }
}