import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const CustomListTile(
      {super.key, required this.leadingIcon, required this.title, this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(leadingIcon),
        title: Text(title),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
