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
    return 'Cabinet{cabinet_id: $id, name: $name, owner_user_id: $user, created_at: $createdAt}';
  }
}