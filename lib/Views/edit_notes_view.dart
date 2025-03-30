import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/Models/notes_model.dart';
import 'package:notes_app/Widgets/Custom_text_field.dart';
import 'package:notes_app/Widgets/custom_app_bar.dart';

class EditNotesView extends StatefulWidget {
  const EditNotesView({super.key, required this.notesModelObject});
  final NotesModel notesModelObject;

  @override
  State<EditNotesView> createState() => _EditNotesViewState();
}

String? title, subtitle;

class _EditNotesViewState extends State<EditNotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                widget.notesModelObject.title =
                    title ?? widget.notesModelObject.title;
                widget.notesModelObject.subtitle =
                    subtitle ?? widget.notesModelObject.subtitle;
                widget.notesModelObject.save();
                BlocProvider.of<ReadNotesCubit>(context).readNotesMethod();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('The notes is updated successfully'),
                  ),
                );
              },
              child: CustomAppBar(
                text: 'Edit note',
                icon: Icons.check,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'Title',
              maxsize: 1,
              onChanged: (value) {
                title = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'content',
              maxsize: 5,
              onChanged: (value) {
                subtitle = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
