import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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

  //Main Function Start
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
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
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text("نام رویداد",textAlign: TextAlign.right,),
                  )
                  ,
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "مانند : جشن تولد",
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
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text("زمان رویداد",textAlign: TextAlign.right,),
                  )
                  ,
                  
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
                          onPressed: (){}, 
                          child:Container(
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Color(0XFF9DA2A6)
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
    );
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
  
}
//Main Class End