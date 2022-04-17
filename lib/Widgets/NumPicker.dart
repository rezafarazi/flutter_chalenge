import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

Widget NumPicker(int max,int min,int value) 
{
  return Row(
    children: [
        Text("Next")
        ,
        new NumberPicker(
        itemHeight: 30,
        itemWidth: 30,
        axis: Axis.horizontal,
        maxValue: max,
        minValue: min,
        onChanged: (int value) =>{
          
        }, 
        value: value,
      )
      ,
      Text("Prive")
    ],
  );
}
