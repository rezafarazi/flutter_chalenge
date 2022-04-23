import 'dart:convert';

import 'package:chalenge_project/Models/events_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    // var databasesPath = await getDatabasesPath();
    // String path = join(databasesPath, 'database.db');

    // WidgetsFlutterBinding.ensureInitialized();
    // db=(await openDatabase(
    //   path,
    //   version: 1,
    //   onCreate: (db,version) async =>{
    //       db.execute("CREATE TABLE events_tbl(id INTEGER PRIMARY KEY, title TEXT, horse INTEGER,min INTEGER,value INTEGER)")
    //   }

    // ));


    // var data_storage=await SharedPreferences.getInstance();
    // if(data_storage.getString("Json_Database") == null)
    // {
    //   await data_storage.setString("Json_Database", "[]");
    // }
    // return;

    var data_storage=await SharedPreferences.getInstance();
    if(data_storage.getString("Json_Title_Database") == null)
    {
      await data_storage.setString("Json_Title_Database", "");
      await data_storage.setString("Json_Horse_Database", "");
      await data_storage.setString("Json_Min_Database", "");
      await data_storage.setString("Json_Value_Database", "");
    }
    return;
    return;

  }


  Future<void> Insert_New_Event(events_model event) async 
  {
    // await db.insert('events_tbl',event.toMap(),ConflictAlgorithm.replace);

    // var data_storage=await SharedPreferences.getInstance();
    // await data_storage.setString("Json_Database", data_storage.getString("Json_Database")!.replaceAll("]", event.toMap().toString()+",]"));

    var data_storage=await SharedPreferences.getInstance();
    await data_storage.setString("Json_Title_Database",data_storage.getString("Json_Title_Database")! + event.title+",");
    await data_storage.setString("Json_Horse_Database",data_storage.getString("Json_Horse_Database")! + event.horse.toString()+",");
    await data_storage.setString("Json_Min_Database",data_storage.getString("Json_Min_Database")! + event.min.toString()+",");
    await data_storage.setString("Json_Value_Database",data_storage.getString("Json_Value_Database")! + event.value.toString()+",");
  }




  Future<String> Get_All_Event() async
  {
    // List<Map<String,dynamic>> events = await db.query('events_tbl');
    // return List.generate(events.length, (index)  {
    //   return events_model(id: events[index]['id'], title: events[index]['title'], horse: events[index]['horse'], min: events[index]['min'], value: events[index]['value']);
    // });



    var data_storage=await SharedPreferences.getInstance();
    return data_storage.getString("Json_Database").toString();


  }



}