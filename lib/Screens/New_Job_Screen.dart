import 'package:chalenge_project/Components/Database.dart';
import 'package:chalenge_project/Models/events_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


//State Class Start
class New_Job_Screen_State extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() => New_Job_Screen();

}
//State Class End


//Main Class STart
class New_Job_Screen extends State<New_Job_Screen_State> 
{


  //Globla Varibel Start
  late int New_Event_Horse;
  late int New_Event_Min;
  late int New_Event_Value;

  late Color Done_Button_Color;

  final new_event_title_text_field = TextEditingController();
  //Globla Varibel End





  //Get Initzie Start
  @override
  void initState() 
  {
    super.initState();
    New_Event_Horse=Curent_Time_Clock_Hor();
    New_Event_Min=Curent_Time_Clock_Min();
    New_Event_Value=1;

    Done_Button_Color=Color(0XFF9DA2A6);
  }
  //Get Initzie End






  //Main Function Start
  @override
  Widget build(BuildContext context) 
  {
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0XFFFBFBFB),
      body: Center(
        child: Column(
          children: [
            Appbar(context)
            ,

            //Main Context Start

            
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Color(0XFFC2C7CC)
                )
              ),
              margin: EdgeInsets.fromLTRB(14, 50, 14, 14),
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text("نام رویداد",textAlign: TextAlign.right,),
                  )
                  ,
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: new_event_title_text_field,
                      onChanged: (text){
                        setState(() {
                          if(text.length>0)
                          {
                            Done_Button_Color=Color(0XFF4361EE);
                          }
                          else
                          {
                            Done_Button_Color=Color(0XFF9DA2A6);
                          }
                        });
                      },
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "مانند : جشن تولد",
                        contentPadding: EdgeInsets.only(top: 1,bottom: 1,left: 14,right:14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1, color: Color(0XFFE4E6E7)),
                        )
                      ),
                    ),
                  )
                ],
              ),
            )
            ,
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Color(0XFFC2C7CC)
                )
              ),
              margin: EdgeInsets.fromLTRB(14, 14, 14, 14),
              height: 230,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text("زمان رویداد",textAlign: TextAlign.right,),
                    margin: EdgeInsets.only(bottom: 18),
                  )
                  ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NumPicker_Hor(24,0)
                      ,
                      Text(":",style: TextStyle(color: Color(0xFFC3C7CB),fontSize: 20),)
                      ,
                      NumPicker_Min(60,0)
                    ],
                  )
                  ,
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text("مدت زمان رویداد (دقیقه)",textAlign: TextAlign.right,),
                    margin: EdgeInsets.only(bottom: 18,top: 18),
                  )
                  ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NumPicker_Value(60,1)
                    ],
                  )
                  
                ],
              ),
            )
            ,
            Container(
                margin: EdgeInsets.all(14),
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: (){

                        if(new_event_title_text_field.text.toString().length>0)
                        {
                          String title_text=new_event_title_text_field.text.toString();
                          int horse_value=New_Event_Horse;
                          int min_value=New_Event_Min;
                          int value_value=New_Event_Value;

                          var event=events_model(id:0,title:title_text,horse:horse_value,min:min_value,value:value_value);
                          new Database().Insert_New_Event(event);
                          Navigator.pop(context,"Get_All_Events");
                        }

                      }, 
                      child:Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Done_Button_Color
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
        //Main Context End
          ],
        ),
      ),
    ));
  }
  //Main Function End


  //App Bar Start
  Widget Appbar(BuildContext context)
  {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:[
          BoxShadow(
            color: Color(0XFFCCCCCC),
            blurRadius: 6
          )
        ]
      ),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Stack(
        children: [

          Center(
            child: Text("رویداد جدید"),
          )
          ,
          Positioned(
            top: 7,
            right: 10,
            child: Container(
              width: 35,
              height: 35,
              child: FlatButton(
                onPressed: (){
                  On_Click_Close(context);
                },
                child: Icon(Icons.close),
              ),
            )
          )

        ],
      ),
    );
  }
  //App Bar End


  //On Close Press Event Start
  void On_Click_Close(BuildContext context)
  {
    Navigator.pop(context);
  }
  //On Close Press Event End
  


//*************************************Function Start*******************************
  int Curent_Time_Clock_Hor()
  {
    return DateTime.now().hour;
  }

  int Curent_Time_Clock_Min()
  {
    return DateTime.now().minute;
  }
//*************************************Function End*******************************





  //*************************************Widgets End*******************************



  //***************Horse Start***************
  Widget NumPicker_Hor(int max,int min) 
  {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1, color: Color(0XFFE4E6E7)
        )
      ),
      child: Row(
        children: [
            Container(
              width: 35,
              padding: EdgeInsets.all(0),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.chevron_left),
                  color: Color(0XFF3473FF),
                  onPressed: (){
                    On_Click_Hor_Prive(min, max);
                  }, 
                ),
              ),
            )
            ,
            NumberPicker(
              textStyle: TextStyle(
                color: Color(0XFF3473FF)
              ),
              itemHeight: 30,
              itemWidth: 30,
              infiniteLoop: true,
              axis: Axis.horizontal,
              maxValue: max,
              minValue: min,            
              onChanged: (int value) =>{
                setState(()=>{
                  if(value>min && value<max)
                    New_Event_Horse=value
                })
              }, 
              value: New_Event_Horse, 
            )
          ,
          SizedBox(
            width: 35,
            child: Center(
              child:IconButton(
                  icon: Icon(Icons.chevron_right),
                  color: Color(0XFF3473FF),
                  onPressed: (){
                  On_Click_Hor_Next(min, max);
                }, 
              )
            ),
          )
        ],
      ),
    );
  }


  void On_Click_Hor_Prive(int min,int max)
  {
    setState(() {
      if(New_Event_Horse>min)
          New_Event_Horse--;
    });
  }


  void On_Click_Hor_Next(int min,int max)
  {
    setState(() {
      if(New_Event_Horse<max)
          New_Event_Horse++;
    });
  }
  //***************Horse End***************


    
  //***************Min Start***************
    Widget NumPicker_Min(int max,int min) 
    {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1, color: Color(0XFFE4E6E7)
          )
        ),
        child: Row(
          children: [
              Container(
                width: 35,
                padding: EdgeInsets.all(0),
                child: Center(
                  child: IconButton(
                  icon: Icon(Icons.chevron_left),
                  color: Color(0XFF3473FF),
                  onPressed: (){
                      On_Click_Min_Prive(max,min);
                    }, 
                  ),
                ),
              )
              ,
              NumberPicker(
                textStyle: TextStyle(
                  color: Color(0XFF3473FF)
                ),
                itemHeight: 30,
                itemWidth: 30,
                infiniteLoop: true,
                axis: Axis.horizontal,
                maxValue: max,
                minValue: min,            
                onChanged: (int value) =>{
                  setState(()=>{
                    if(value>min && value<max)
                      New_Event_Min=value
                  })
                }, 
                value: New_Event_Min, 
              )
            ,
            SizedBox(
              width: 35,
              child: Center(
                child:IconButton(
                  icon: Icon(Icons.chevron_right),
                  color: Color(0XFF3473FF),
                  onPressed: (){
                    On_Click_Min_Next(max,min);
                  }, 
                )
              ),
            )
          ],
        ),
      );
    }


    void On_Click_Min_Prive(int max,int min)
    {
      setState(() {
        if(New_Event_Min>min)
          New_Event_Min--;
      });
    }


    void On_Click_Min_Next(int max,int min)
    {
      setState(() {
        if(New_Event_Min<max)
          New_Event_Min++;
      });
    }
    //***************Min End***************



  //***************Value Start***************
    Widget NumPicker_Value(int max,int min) 
    {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1, color: Color(0XFFE4E6E7)
          )
        ),
        child: Row(
          children: [
              Container(
                width: 35,
                padding: EdgeInsets.all(0),
                child: Center(
                  child: IconButton(
                  icon: Icon(Icons.chevron_left),
                  color: Color(0XFF3473FF),
                  onPressed: (){
                      On_Click_Value_Prive(max, min);
                    }, 
                  ),
                ),
              )
              ,
              NumberPicker(
                textStyle: TextStyle(
                  color: Color(0XFF3473FF)
                ),
                itemHeight: 30,
                itemWidth: 30,
                axis: Axis.horizontal,
                maxValue: max,
                minValue: min,
                infiniteLoop: true,            
                onChanged: (int value) =>{
                  setState(()=>{
                    if(value>min && value<max)
                      New_Event_Value=value
                  })
                }, 
                value: New_Event_Value, 
              )
            ,
            SizedBox(
              width: 35,
              child: Center(
                child:IconButton(
                  icon: Icon(Icons.chevron_right),
                  color: Color(0XFF3473FF),
                  onPressed: (){
                    On_Click_Value_Next(max, min);
                  }, 
                )
              ),
            )
          ],
        ),
      );
    }


    void On_Click_Value_Prive(int max,int min)
    {
      setState(() {
        if(New_Event_Value>min)
          New_Event_Value--;
      });
    }


    void On_Click_Value_Next(int max,int min)
    {
      setState(() {
        if(New_Event_Value<max)
          New_Event_Value++;
      });
    }
    //***************Value End***************


  //*************************************Widgets Start*******************************




}
//Main Class End