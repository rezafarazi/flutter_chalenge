import 'dart:html';

import 'package:chalenge_project/Components/Database.dart';
import 'package:chalenge_project/Models/events_model.dart';
import 'package:chalenge_project/Screens/New_Job_Screen.dart';
// import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:shamsi_date/shamsi_date.dart';

//State Class Start
class Main_Screen_State extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => Main_Screen();
}
//State Class End


//Main Class Start
class Main_Screen extends State<Main_Screen_State>
{




  //Appbar Header Date Start
   String _format(Date d) 
   {
    final f = d.formatter;
    return '${f.wN} ${f.d}/${f.mN}/${f.yy}';
  }
  //Appbar Header Date End



  //InitilState Start
  @override
  void initState() 
  {
    super.initState();
    //Get Initizlize Database
    new Database().init_database();

  }
  //InitilState End



  //Main Function Start
  @override
  Widget build(BuildContext context) 
  {
    return SafeArea(
      child:Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-10,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: DayView(
                      date: DateTime.now(),
                      isRTL: true,
                      style: DayViewStyle(
                        currentTimeCircleRadius: BorderRadius.circular(5),
                        backgroundColor: Color(0XFFFFFFFF),
                        backgroundRulesColor : Color(0XFFC2C7CC),
                        currentTimeCircleColor: Color(0XFF4361EE),
                        currentTimeRuleColor: Color(0XFF4361EE),
                      ),
                      dayBarStyle: DayBarStyle(
                        color: Color(0XFFE5E5E5),
                        textStyle: TextStyle(
                          color: Color(0XFFE5E5E5)
                        ),
                      ),
                      userZoomable: false,
                      events: [
                        FutureBuilder<events_model>(
                          future: ,
                        )
                        FlutterWeekViewEvent(
                          backgroundColor: Color(0XFF3A0CA3),                        
                          title: 'An event 1',
                          description: 'A description 1',
                          start: DateTime.now().subtract(const Duration(minutes: 1)),
                          end: DateTime.now().add(const Duration(minutes: 50)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
            ,
            Positioned(
              child: Appbar(context),
              top: 0,
            )
            ,
            Positioned(
              bottom: 10,
              child:Container(
                margin: EdgeInsets.all(14),
                width: MediaQuery.of(context).size.width-28,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: (){
                        On_Click_New_Job(context);
                      }, 
                      child:Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Color(0XFF4361EE)
                          ),
                          child: Center(
                            child: Text(
                              "ثبت"
                              ,
                              style: TextStyle(
                                color: Color(0XFFFFFFFF)
                              ),),
                          ),
                        ),
                    ),
                )
              )
            )
          ],
        ),
      )
    );
  }
  //Main Function End



  //Appbar Start
  Widget Appbar(BuildContext context)
  {
    return Container(
      color: Color(0XFFFFFFFF),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Center(child: Text(_format(Jalali.now())),),
    );
  }
  //Appbar End



  //Get New Job Start
  void On_Click_New_Job(BuildContext context)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>New_Job_Screen_State()));
  }
  //Get New Job End






}
//Main Class End