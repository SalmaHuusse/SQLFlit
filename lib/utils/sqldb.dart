
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class  SqlDb {

  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDB();
      return _db;
    }
    else {
      return _db;
    }
  }

  intialDB() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'employe.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 1);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "employes" (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
     name TEXT NOT NULL,
     age  TEXT NOT NULL,
     department TEXT NOT NULL,
     city TEXT NOT NULL
    ) 
   ''');
    print(
        "Create Database and table ====================================================");
  }

  redDate(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }
  insertDate(String sql) async{
    Database? mydb=await db;
    int  response =await mydb!.rawInsert(sql);
    return response ;
  }
  updateDate(String sql) async{
    Database? mydb=await db;
    int response =await mydb!.rawUpdate(sql);
    return response ;
  }
  daletDate(String sql) async{
    Database? mydb=await db;
    int  response =await mydb!.rawDelete(sql);
    return response ;
  }

}