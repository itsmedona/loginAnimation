import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextConst extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  bool? weight;
  TextConst({super.key,required this.text,this.size,this.color,this.weight});

  @override
  Widget build(BuildContext context) {
    return  Text(text,

      style: TextStyle(color:color??Colors.white,fontSize:size?? 16,
          fontWeight:weight==null?FontWeight.w600: FontWeight.w700
      ),);
  }
}