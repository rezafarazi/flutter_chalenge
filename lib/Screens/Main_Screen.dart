import 'package:chalenge_project/Screens/New_Job_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  //Main Function Start
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: (){
            On_Click_New_Job(context);
          }, 
          child: Text("Click Me")
        ),
      ),
    );
  }
  //Main Function End


  //Get New Job Start
  void On_Click_New_Job(BuildContext context)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>New_Job_Screen_State()));
  }
  //Get New Job End


}
//Main Class End