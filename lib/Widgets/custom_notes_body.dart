import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/Custom_note_item.dart';
import 'package:notes_app/Widgets/custom_app_bar.dart';

class CustomNotesBody extends StatelessWidget {
  const CustomNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child:Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CustomNoteItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
