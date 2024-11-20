import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget{

  final Color colour;
  final Widget? cardChild;
  final VoidCallback ? onPress;
  ReusableCard({this.cardChild, this.onPress, required this.colour});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),

    );
    throw UnimplementedError();
  }
}