import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/custom_Icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 28),
          ),
          Spacer(),
          CustomIcon(icon: icon,),
        ],
      ),
    );
  }
}
