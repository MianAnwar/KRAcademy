import 'dart:io';
import 'package:kacademy/Objects_Layer/LoginCredentials.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  ////////< Singleton >/////////
  static DBHelper _dbHelper;
  static Database _database;
  factory DBHelper() {
    if (_dbHelper == null) {
      _dbHelper = DBHelper.createInstance();
    }
    return _dbHelper;
  }
  DBHelper.createInstance();

////////< Setting up for DB >//////////
  void _createDB(Database db, int newVersion) async {
    String query =
        'CREATE TABLE loginCredentials (id INTEGER PRIMARY KEY, phoneno TEXT, pwd TEXT, who TEXT)';
    await db.execute(query);
  }

  Future<Database> initializeDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'credentials.db';
    var credDB = await openDatabase(path, version: 1, onCreate: _createDB);
    return credDB;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDB();
    }
    return _database;
  }

////////< Local DB CRUD operations >//////////
  Future<int> insertCredentials(LoginCredentials cred) async {
    Database db = await this.database;
    var res = await db.insert("loginCredentials", cred.toMap());
    return res;
  }

  //    //----------//No need so far//----------//    //
  Future<int> updateCredentials(LoginCredentials cred) async {
    Database db = await this.database;
    var res = await db.update("loginCredentials", cred.toMap(),
        where: "id", whereArgs: [cred.id]);
    return res;
  } //    //----------//No need so far//----------//    //

  Future<int> deleteCredentials() async {
    Database db = await this.database;
    var res = await db.rawDelete("DELETE FROM loginCredentials");
    return res;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT(*) FROM loginCredentials');
    var res = Sqflite.firstIntValue(x);
    return res;
  }

  Future<LoginCredentials> getloginCredentials() async {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM loginCredentials');

    LoginCredentials cred = LoginCredentials.fromMapObj(result[0]);
    return cred;
  }
}
