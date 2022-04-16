import 'package:chalenge_project/Screens/OTP_Screen.dart';
import 'package:flutter/material.dart';

//All Application Main Function Start
void main() 
{
  runApp(App());
}
//All Application Main Function End


class App extends StatelessWidget 
{
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      title: 'Flutter Chalenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OTP_Screen_State(),
    );
  }
}
