import 'package:mysql_client/mysql_client.dart';
import '../../auth/id_connect.dart';

class ConnexionDb{
  static final ConnexionDb _singleton = ConnexionDb._internal();
  late MySQLConnection connection;

  factory ConnexionDb(){
    return _singleton;
  }

  ConnexionDb._internal();

  static Future<ConnexionDb> create() async{
    var instance = ConnexionDb._internal();
    await instance.connectDatabase();
    return instance;
  }

  Future<void> connectDatabase() async{
    try{
      connection = await MySQLConnection.createConnection(
        host: '$host',
        port: int.parse('$port'),
        userName: '$userName',
        password: '$password',
        databaseName: '$databaseName'
      );
      await connection.connect();
    } catch(e, s){
      print('$e\n$s');
    }
  }

  MySQLConnection get connexion => connection;
}