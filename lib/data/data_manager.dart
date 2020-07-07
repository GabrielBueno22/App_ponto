import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';

import 'local/database.dart';
import 'local/database_helper.dart';
import 'model/login.dart';
import 'model/login_token.dart';
import 'network/api_base_helper.dart';

class DataManager {
  ApiBaseHelper _apiBaseHelper = ApiBaseHelper.instance;
  DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  // Singleton
  DataManager._privateConstructor();
  static final DataManager instance = DataManager._privateConstructor();
  // START LOGIN
  Future<dynamic> postLogin(Login login) async {
    try {
      Map<String, dynamic> body = {
        'username': login.user,
        'password': login.pwd,
        'client_id': ApiBaseHelper.client_id,
        'client_secret': ApiBaseHelper.client_secret,
        'grant_type': 'password'
      };
      Dio dio = await _apiBaseHelper.getDio();
      dio.options.headers['Content-Type'] = 'application/json;charset=UTF-8';
      Response response = await dio.post("/oauth/token", data: body);
      return response;
    } on DioError catch (e) {
      return e;
    }
  }

  Future<int> insertLogin(Login login) async {
    Database db = await _databaseHelper.database;
    int id = await db.insert(LoginDB.tableName, login.toJson());
    return id;
  }

  Future<int> updateLogin(Login login) async {
    Database db = await _databaseHelper.database;
    return await db.update(LoginDB.tableName, login.toJson());
  }

  Future<int> deleteAllLogin() async {
    Database db = await _databaseHelper.database;
    int id = await db.delete(LoginDB.tableName);
    return id;
  }

  Future<int> getCountLogin() async {
    Database db = await _databaseHelper.database;
    List<Map> maps = await db.query(LoginDB.tableName);
    return maps.length;
  }

  Future<Login> getLastLogin() async {
    Database db = await _databaseHelper.database;
    List<Map> tokens = await db.query(LoginDB.tableName);
    if (tokens.length > 0) {
      return Login().fromJson(tokens.last);
    }
    return null;
  }
  // END LOGIN

  // START LOGIN TOKEN
  Future<int> insert(LoginToken loginToken) async {
    Database db = await _databaseHelper.database;
    int id = await db.insert(LoginTokenDB.tableName, loginToken.toJson());
    return id;
  }

  Future<LoginToken> getLoginTokenById(int _id) async {
    Database db = await _databaseHelper.database;
    List<Map> tokens = await db.query(LoginTokenDB.tableName,
        columns: [
          LoginTokenDB.id,
          LoginTokenDB.tokenType,
          LoginTokenDB.expiresIn,
          LoginTokenDB.accessToken,
          LoginTokenDB.refreshToken
        ],
        where: '${LoginTokenDB.id} = ?',
        whereArgs: [_id]);
    if (tokens.length > 0) {
      return LoginToken.fromJson(tokens.first);
    }
    return null;
  }

  Future<List<LoginToken>> getAllLoginToken() async {
    Database db = await _databaseHelper.database;
    List<Map> maps = await db.query(LoginTokenDB.tableName);
    if (maps.length > 0) {
      List<LoginToken> logins = [];
      maps.forEach((map) => logins.add(LoginToken.fromJson(map)));
      return logins;
    }
    return null;
  }

  Future<LoginToken> getLastLoginToken() async {
    Database db = await _databaseHelper.database;
    List<Map> tokens = await db.query(LoginTokenDB.tableName);
    if (tokens.length > 0) {
      return LoginToken.fromJson(tokens.last);
    }
    return null;
  }

  Future<int> update(LoginToken loginToken) async {
    Database db = await _databaseHelper.database;
    return await db.update(LoginTokenDB.tableName, loginToken.toJson());
  }

  Future<int> deleteAll() async {
    Database db = await _databaseHelper.database;
    int id = await db.delete(LoginTokenDB.tableName);
    return id;
  }
  // END LOGIN TOKEN

}
