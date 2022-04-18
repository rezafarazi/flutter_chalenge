import 'package:chalenge_project/Screens/New_Job_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

    return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
  }
  //Appbar Header Date End


  //Main Function Start
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      backgroundColor: Color(0XFFE5E5E5),
      body: Column(
        children: [
          Appbar(context),
        ],
      ),
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