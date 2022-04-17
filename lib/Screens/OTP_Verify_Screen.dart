import 'dart:html';

import 'package:chalenge_project/Screens/OTP_Verify_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

//States Class Start
class OTP_Verify_Screen_State extends StatefulWidget
{
  //Pass Data Start
  String user_phone_number_text_field = "";
  //Pass Data End

  //Constractor Start
  OTP_Verify_Screen_State(String user_phone_number_text_field_text)
  {
    user_phone_number_text_field=user_phone_number_text_field_text;
  }
  //Constractor End

  @override
  State<StatefulWidget> createState()=>OTP_Verify_Screen(user_phone_number_text_field);
}
//States Class End


//Main Class Start
class OTP_Verify_Screen extends State<OTP_Verify_Screen_State> 
{

  String user_phone_number_text_field_text="";

  //Constractor Start
  OTP_Verify_Screen(String user_phone_number_text_field_text)
  {
    this.user_phone_number_text_field_text=user_phone_number_text_field_text;
  }
  //Constractor End


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
                  Container(
                    width: 250,
                    child: 
                      Text("کد چهار رقمی ارسال شده به شماره‌ی $user_phone_number_text_field_text را وارد کنید.",
                    style: TextStyle(

                    ),
                    maxLines: 2,
                    textAlign : TextAlign.center),
                  )
                  ,
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    width: 250,
                    child: PinCodeTextField(
                      length: 4,
                      appContext: context, 
                      onChanged: (String value) {  },
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        borderWidth: 1,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(20),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Color.fromRGBO(185, 235, 251, 0.2),
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
                          onPressed: (){On_Click_Done_Button(context);}, 
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
  void On_Click_Done_Button(BuildContext context)
  {
  }
  //Get On Click Done Button Event End

  /***********************************Event End********************************/



}
//Main Class End