import 'package:flutter/material.dart';

import '../../models/wine_model.dart';

class noteCard extends StatelessWidget{
  final Wine wine;

  const noteCard({super.key, required this.wine});

  @override
  Widget build(BuildContext context) {
    double dimension = MediaQuery.of(context).size.width;

    return Container(
      width: dimension*0.9,
      height: dimension*0.5,
        decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
    ),),
      child: Row(
        children: [
          Container(
            width: dimension*0.09,

          ),
          Container(

          ),
          Container(
            width: dimension*0.5,
          )
        ],
      ),
    );
  }

}