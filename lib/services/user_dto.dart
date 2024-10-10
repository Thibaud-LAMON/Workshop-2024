import 'package:mysql_client/mysql_client.dart';
import 'package:workshop/services/cabinet_dto.dart';
import '../models/User.dart';
import 'common/crud.dart';

class UserDto extends Crud {
  final String _table = 'users';

  Future<User?> getById(int id, [MySQLConnection? connexion]) async {
    IResultSet result = await super.read(_table, {'id': id}, connexion);
    User? user;
    for (var element in result.rows){
      Map data = element.assoc();
      user = User(
        id: int.parse(data['id']),
        name: data['name'],
        email: data['email'],
        password: data['password'],
        cabinet: (await CabinetDto().getById(int.parse(data['cabinet']), connexion))!,
        createdAt: DateTime.parse(data['createdAt'])
      );
    }
    return user;
  }
}