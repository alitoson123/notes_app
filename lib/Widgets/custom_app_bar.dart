import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/custom_buttom.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 55,
        ),
        Text(
          'Notes',
          style: TextStyle(fontSize: 28),
        ),
         Spacer(),
        CustomButtom(),
      ],
    );
  }
}
