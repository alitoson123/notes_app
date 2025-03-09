import 'package:flutter/material.dart';
import 'package:notes_app/Views/edit_notes_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.color});

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4, left: 4, bottom: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditNotesView();
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    'Flutter tips',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'The first course',
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: .5),
                        fontSize: 19,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 8),
                  child: Text(
                    'March 7,2025',
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: .5),
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
