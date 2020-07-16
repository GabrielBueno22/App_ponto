class LoginDB {
  static String tableName = 'login';
  static String id = '_id';
  static String user = 'user';
  static String pwd = 'pwd';

  static String createTable() {
    return '''CREATE TABLE $tableName (
                $id INTEGER PRIMARY KEY,
                $user TEXT NOT NULL,
                $pwd TEXT NOT NULL
              )''';
  }

  static String dropTable() {
    return '''DROP TABLE $tableName''';
  }
}

class LoginTokenDB {
  static String tableName = 'loginToken';
  static String id = '_id';
  static String tokenType = 'token_type';
  static String expiresIn = 'expires_in';
  static String accessToken = 'access_token';
  static String refreshToken = 'refresh_token';

  static String createTable() {
    return '''CREATE TABLE $tableName (
                $id INTEGER PRIMARY KEY,
                $tokenType TEXT NOT NULL,
                $expiresIn INTEGER NOT NULL,
                $accessToken TEXT NOT NULL,
                $refreshToken TEXT NOT NULL
              )''';
  }

  static String dropTable() {
    return '''DROP TABLE $tableName''';
  }
}

class PontoDB {
  static String tableName = 'ponto';
  static String id = '_id';
  static String id_funcionario = 'id_funcionario';
  static String entrada = 'entrada';
  static String saida = 'saida';
  static String intervalo = 'intervalo';
  static String visita = 'visita';
  static String isVisita = 'isVisita';
  static String fim = 'fim';

  static String createTable() {
    return '''CREATE TABLE $tableName (
                $id INTEGER PRIMARY KEY AUTOINCREMENT,
                $id_funcionario INTEGER NOT NULL,
                $entrada TEXT NOT NULL,
                $saida TEXT,
                $intervalo TEXT,
                $visita TEXT,
                $isVisita INTEGER NOT NULL,
                $fim INTEGER NOT NULL
              )''';
  }

  static String dropTable() {
    return '''DROP TABLE $tableName''';
  }
}
