import 'package:mysql_client/mysql_client.dart';
import 'package:workshop/services/user_dto.dart';
import '../models/Cabinet.dart';
import 'common/crud.dart';

class CabinetDto extends Crud {
  final String _table = 'cabinets';

  Future<Cabinet?> getById(int id, [MySQLConnection? connexion]) async {
    IResultSet result = await super.read(_table, {'id': id}, connexion);
    Cabinet? cabinet;
    for (var element in result.rows){
      Map data = element.assoc();
      cabinet = Cabinet(
        id: int.parse(data['id']),
        name: data['name'],
        user: (await UserDto().getById(int.parse(data['user']), connexion))!,
        createdAt: DateTime.parse(data['createdAt']),
      );
    }
    return cabinet;
  }
}