import 'enums/invitations/Status.dart';

import 'Cabinet.dart';

class Invitation{
  int id;
  String email;
  Cabinet cabinet;
  Status status;
  DateTime createdAt;

  Invitation({
    required this.id,
    required this.email,
    required this.cabinet,
    required this.status,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'Invitation{invitationId: $id, email: $email, cabinetId: $cabinet, status: $status, createdAt: $createdAt}';
  }
}