import 'enums/invitations/Status.dart';

import 'Cabinet.dart';

class Invitation{
  int id;
  String email;
  Cabinet cabinet;
  Status status = Status.PENDING;
  DateTime? createdAt = DateTime.now();

  Invitation({
    required this.id,
    required this.email,
    required this.cabinet,
    required this.status,
    this.createdAt,
  });

  @override
  String toString() {
    return 'Invitation{invitation_id: $id, email: $email, cabinet_id: $cabinet, status: $status, created_at: $createdAt}';
  }
}