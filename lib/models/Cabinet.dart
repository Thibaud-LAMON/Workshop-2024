

import 'User.dart';

class Cabinet{
  int? cabinetId;
  String name;
  User? ownerUserId;
  DateTime createdAt;

  Cabinet({
    this.cabinetId,
    required this.name,
    this.ownerUserId,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'Cabinet{cabinetId: $cabinetId, name: $name, ownerUserId: $ownerUserId, createdAt: $createdAt}';
  }
}