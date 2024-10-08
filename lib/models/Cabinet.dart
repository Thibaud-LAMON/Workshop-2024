

import 'User.dart';

class Cabinet{
  int? id;
  String name;
  User? user;
  DateTime createdAt;

  Cabinet({
    this.id,
    required this.name,
    this.user,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'Cabinet{cabinetId: $id, name: $name, ownerUserId: $user, createdAt: $createdAt}';
  }
}