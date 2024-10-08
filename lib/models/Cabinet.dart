

import 'User.dart';

class Cabinet{
  int id;
  String name;
  User user;
  DateTime? createdAt = DateTime.now();

  Cabinet({
    required this.id,
    required this.name,
    required this.user,
    this.createdAt,
  });

  @override
  String toString() {
    return 'Cabinet{cabinetId: $id, name: $name, ownerUserId: $user, createdAt: $createdAt}';
  }
}