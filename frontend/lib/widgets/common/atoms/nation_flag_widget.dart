import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/flag_util.dart';

class NationFlag extends StatelessWidget {
  final String country;
  final double height;
  final double width;

  const NationFlag({
    super.key,
    required this.country,
    required this.height,
    required this.width,
  });

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
          FlagUtil.flagCodeMap[country]!,
          height: this.height,
          width: this.width,
          flagSize: FlagSize.size_1x1,
        ),
      ),
    );
  }
}
