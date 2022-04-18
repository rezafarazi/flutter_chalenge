import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class Database
{
  
  void init_database()
  {
    WidgetsFlutterBinding.ensureInitialized();
    final db=openDatabase(join(await getDatabasePath(),"events_database.db"));
  }

}