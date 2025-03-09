import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/Custom_text_field.dart';

class CustomModelButtomSheet extends StatelessWidget {
  const CustomModelButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
           CustomTextField(hintText: 'title', maxsize: 1),
            SizedBox(
              height: 20,
            ),
           CustomTextField(hintText: 'content', maxsize: 5),
          ],
        ),
      ),
    );
  }
}
