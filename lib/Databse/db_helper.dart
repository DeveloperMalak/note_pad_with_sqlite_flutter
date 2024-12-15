import 'dart:io'as io;

import 'package:note_pad/Model.dart/userEntry_model.dart';
import 'package:note_pad/Model.dart/userEntry_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

class DbHelper{
  static Database? _db;
  Future<Database?> get db async{
   if(_db!=null){
    return _db;
   }
   _db=await initDatabase();
   return _db;
  }

  initDatabase()async{
  io.Directory directory=await getApplicationDocumentsDirectory();
  String path=join(directory.path,'noteTable.db');
  var db=await openDatabase(path,version: 1,onCreate: onCreate);
  return db;
  }
 onCreate(Database db,int version)async{
  await db.execute('create table noteTable(id integer primary key autoincrement,userid text unique,username text,usernumber integer);');

 }
 Future<UserModel> insertData(UserModel user)async{
  var dbClient=await db;
  await dbClient?.insert('noteTable', user.toMap());
  return user;
 }

 Future<List<UserModel>> fetchData()async{
  var dbClient=await db;
  List<Map<String,dynamic>> result=await dbClient!.query('noteTable');
  return result.map((e)=>UserModel.fromMap(e)).toList();
 }
 Future<int> updateData(UserModel useredit)async{
 var dbClient=await db;
 return await  dbClient!.update('noteTable',useredit.toMap(),
 where:'id=?',whereArgs: [useredit.id]);

 }
 Future<int> deleteData(int id)async{
  var dbClient=await db;
  return dbClient!.delete('noteTable',where:'id=?',whereArgs: [id]);
 }
}