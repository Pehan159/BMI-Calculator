import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/constant.dart';

class IconContent extends StatelessWidget{

  final IconData icon;
  final String lable;

  IconContent({required this.icon,  required  this.lable});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,size: 80.0,),
        const SizedBox(
          height: 15.0,
        ),
        Text(lable,
        style: kLabelTextStyle,)

      ],
    );
    throw UnimplementedError();
  }

}