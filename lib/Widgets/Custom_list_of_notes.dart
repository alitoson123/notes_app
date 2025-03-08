import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/Custom_note_item.dart';

class CustomListOfNotes extends StatelessWidget {
  const CustomListOfNotes({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colorsList = [
      Colors.amber,
      Colors.yellow,
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.pink
    ];
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: colorsList.length,
          itemBuilder: (context, index) {
            return CustomNoteItem(color: colorsList[index],);
          },
        ),
      ),
    );
  }
}
