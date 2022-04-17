import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//States Class Start
class OTP_Screen_State extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()=>OTP_Screen();
}
//States Class End


//Main Class Start
class OTP_Screen extends State<OTP_Screen_State> 
{

  //Main Function Start
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: Center(
        child: Wrap(
          children: [ 
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: Column(
                children: [
                  Text("لطفا شماره‌ی تلفن همراه خود را وارد کنید.")
                  ,
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    width: MediaQuery.of(context).size.width*0.8,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "مثال : 09365464786",
                        fillColor:Color.fromRGBO(185, 235, 251, 0.2),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(width: 3, color: Color(0XFF4CC9F0)),
                        )
                      ),
                    ),
                  )
                  ,
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width*0.8,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child:FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: On_Click_Done_Button, 
                          child:Container(
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  colors: <Color>[
                                    Color(0xFF4CC9F0),
                                    Color(0xFF4361EE),
                                    // Color(0xFF3A0CA3),
                                    // Color(0xFF3A0CA3),
                                  ]
                                )
                              ),
                              child: Center(
                                child: Text(
                                  "ارسال"
                                  ,
                                  style: TextStyle(
                                    color: Color(0XFFFFFFFF)
                                  ),),
                              ),
                            ),
                        ),
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  //Main Function End





  /***********************************Event Start********************************/

  //Get On Click Done Button Event Start
  void On_Click_Done_Button()
  {

  }
  //Get On Click Done Button Event End

  /***********************************Event End********************************/



}
//Main Class End