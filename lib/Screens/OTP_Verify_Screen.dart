import 'dart:convert';

import 'package:chalenge_project/Screens/Main_Screen.dart';
import 'package:chalenge_project/Screens/OTP_Verify_Screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final verify_controller=TextEditingController();


  //Constractor Start
  OTP_Verify_Screen(String user_phone_number_text_field_text)
  {
    this.user_phone_number_text_field_text=user_phone_number_text_field_text;
  }
  //Constractor End




  //Send Request Start
  void Send_Phone_Number() async 
  {
    var response = await http.post(Uri.parse("https://challenge.reval.me/v1/calendar/create"),body: jsonEncode(
      <String,String>{
        'username':user_phone_number_text_field_text
      }
    ));
  }
  //Send Request End




  //Initilize Start
  @override
  void initState() 
  {
    super.initState();
    Send_Phone_Number();
  }
  //Initilize End





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
                      controller: verify_controller,
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





  /****\*******************************Event Start********************************/

  //Get On Click Done Button Event Start
  void On_Click_Done_Button(BuildContext context)
  {
    var Check=Check_Verify_Code();
    Check.then((value){
      if(value)
      {
        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> Main_Screen_State()),(Route<dynamic> route)=>false);
      }
      else
      {
        Navigator.pop(context);
      }
    });
  }
  //Get On Click Done Button Event End


  Future<bool> Check_Verify_Code() async
  {
    var response = await http.post(Uri.parse("https://challenge.reval.me/v1/auth/verify"),body:jsonEncode(
      <String,String>{
          "username": user_phone_number_text_field_text,
          "key": verify_controller.text.toString(),
          "otp": "0"
        }
    ));

    if(response.statusCode==200)
    {
      Save_Phone();
      return true;
    }
    
    return false;

  }


  /***********************************Event End********************************/



  //Save Phone Number Start
  void Save_Phone() async 
  {
    var data_storage=await SharedPreferences.getInstance();
    await data_storage.setString("Phone", this.user_phone_number_text_field_text);
  }
  //Save Phone Number End



}
//Main Class End