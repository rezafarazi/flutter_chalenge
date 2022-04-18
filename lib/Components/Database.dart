import 'package:chalenge_project/Models/events_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:path/path.dart';


class Database
{


  //Globla Variabls
  var db;
  

  
  void init_database() async
  {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'database.db');

    WidgetsFlutterBinding.ensureInitialized();
    db=(await openDatabase(
      path,
      version: 1,
      onCreate: (db,version) async =>{
          db.execute("CREATE TABLE events_tbl(id INTEGER PRIMARY KEY, title TEXT, horse INTEGER,min INTEGER,value INTEGER)")
      }

    ));
  }


  Future<void> Insert_New_Event(events_model event) async 
  {
    await db.insert('events_tbl',event.toMap(),ConflictAlgorithm.replace);
  }


}