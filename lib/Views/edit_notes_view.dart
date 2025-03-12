import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/Custom_text_field.dart';
import 'package:notes_app/Widgets/custom_app_bar.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            CustomAppBar(
              text: 'Edit note',
              icon: Icons.check,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(hintText: 'Title', maxsize: 1, onChanged: (String ) {  },),
            SizedBox(
              height: 20,
            ),
            CustomTextField(hintText: 'content', maxsize: 5, onChanged: (String ) {  },),
          ],
        ),
      ),
    );
  }
}
