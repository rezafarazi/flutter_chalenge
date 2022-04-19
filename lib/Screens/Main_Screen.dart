import 'package:chalenge_project/Components/Database.dart';
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
        backgroundColor: Color(0XFFE5E5E5),
        body: Stack(
          children: [
            Column(
              children: [
                Appbar(context),
                Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: MediaQuery.of(context).size.height-80,
                  child: DayView(
                    date: DateTime.now(),
                    isRTL: true,
                    userZoomable: false,
                  ),
                )
              ],
            )
            ,
            Positioned(
              bottom: 10,
              child:FlatButton
              (
                onPressed: (){
                  On_Click_New_Job(context);
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: 50,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Color(0XFF4361EE)
                    ),
                    child: Center(
                      child: Text(
                        "رویداد جدید"
                        ,
                        style: TextStyle(
                          color: Color(0XFFFFFFFF)
                        ),),
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