import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class reusableColumn extends StatelessWidget {
  reusableColumn({@required this.icon,@required this.text});
  final IconData icon;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color:Colors.white ,
        ),
        SizedBox(
          height: 15,
        ),
        Text(text,
          style: KLabelStyle,
        ),
      ],
    );
  }
}

class reusableCard extends StatelessWidget {
  reusableCard({@required this.colour,this.childCard,this.onPress});
  final Color colour;
  final Widget childCard;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,

          borderRadius: BorderRadius.circular(8),

        ),
      ),
    );
  }
}
