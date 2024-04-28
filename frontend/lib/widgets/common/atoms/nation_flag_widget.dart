import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class NationFlag extends StatelessWidget {
  final double height;
  final double width;

  const NationFlag({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: ClipOval(
        child: Flag.fromCode(
          FlagsCode.US,
          height: this.height,
          width: this.width,
          flagSize: FlagSize.size_1x1,
        ),
      ),
    );
  }
}
