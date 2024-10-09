import "package:mysql_client/src/mysql_client/connection.dart";

import '../common/connexion_db.dart';

class Crud {
  static ConnexionDb? defaultDb;
  Future<void> initDefaultConnexion() async {
    defaultDb = await ConnexionDb.create();
  }

  // Create
  Future<BigInt> create(String tableName,
      Map<String, dynamic> data,
      [MySQLConnection? connexion]) async {
    if (connexion == null) { // Si la connexion n'est pas fournie
      if (defaultDb == null) {  // On vérifie si la connexion par défaut n'est pas initialisée
        await initDefaultConnexion(); // Si elle ne l'est pas, on l'initialise
      }
      connexion = defaultDb!.connection; // On récupère la connexion par défaut
    }
    var values = data.values.toList(); // On récupère les valeurs des champs
    String fieldNames = data.keys.toList().join(", "); // On récupère les noms des champs
    String fieldValues = List<String>.filled(values.length, "?").join(", "); // On crée une liste de "?" de la taille des valeurs
    PreparedStmt statement = await connexion.prepare(
      "INSERT INTO $tableName ($fieldNames) VALUES ($fieldValues)",
    ); // On prépare la requête
    IResultSet result = await statement.execute(values); // On exécute la requête
    return result.lastInsertID; // On retourne l'ID du dernier élément inséré
  }

  // Read
  Future<IResultSet> read(String tableName,
      [
        Map<String, dynamic> conditions = const {},
        MySQLConnection? connexion
      ]
      ) async {
    if (connexion == null) {
      if (defaultDb == null) {
        await initDefaultConnexion();
      }
      connexion = defaultDb!.connection;
    }
    String query = "SELECT * FROM $tableName"; // On crée la requête
    if (conditions.isNotEmpty) {
      String where = conditions.keys.map((key) => "$key = ?").join(" AND ");
      query += " WHERE $where";
    } // On ajoute les conditions à la requête si elles existent
    PreparedStmt statement = await connexion.prepare(query);
    IResultSet resultSet = await statement.execute(conditions.values.toList());

    return resultSet; // On retourne le résultat
  }

  // Update
  Future<BigInt> put(String tableName,
      Map data,
      Map conditions,
      [MySQLConnection? connexion]
      ) async {
    if (connexion == null) {
      if (defaultDb == null) {
        await initDefaultConnexion();
      }
      connexion = defaultDb!.connection;
    }
    var set = data.entries.map((e) => "${e.key} = ?").join(", "); // On crée la liste des champs à mettre à jour
    var where = conditions.entries.map((e) => "${e.key} = ?").join(" AND "); // On crée la liste des conditions
    var values = [...data.values, ...conditions.values]; // On crée la liste des valeurs
    PreparedStmt statement = await connexion.prepare(
      "UPDATE $tableName SET $set WHERE $where",
    ); // On prépare la requête
    IResultSet result = await statement.execute(values);
    return result.lastInsertID; // On retourne l'ID du dernier élément inséré
  }

  // Delete
  Future<BigInt> delete(
      String tableName,
      Map<String, dynamic> conditions,
      [MySQLConnection? connexion]
      ) async {
    if (connexion == null) {
      if (defaultDb == null) {
        await initDefaultConnexion();
      }
      connexion = defaultDb!.connection;
    }
    List<String> where = conditions.keys.map((key) => "$key = ?").toList(); // On crée la liste des conditions
    List<dynamic> values = conditions.values.toList(); // On crée la liste des valeurs
    PreparedStmt statement = await connexion.prepare(
      "DELETE FROM $tableName WHERE ${where.join(' AND ')}",
    ); // On prépare la requête
    IResultSet result = await statement.execute(values);

    return result.affectedRows; // On retourne le nombre de lignes affectées
  }
}