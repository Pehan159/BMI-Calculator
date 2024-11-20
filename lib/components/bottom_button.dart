import 'package:flutter/cupertino.dart';
import 'package:new_project/constant.dart';

class BottumButton extends StatelessWidget{
BottumButton({ @required this.onTap, this.bottomTital});
  final VoidCallback? onTap;
  final String? bottomTital;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity, // Give full width of the screen
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            bottomTital.toString(),
            style: kLabelTextStyle,
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

}