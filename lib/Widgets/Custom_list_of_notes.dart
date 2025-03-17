import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/Cubits/read_notes_cubit/read_notes_states.dart';
import 'package:notes_app/Models/notes_model.dart';
import 'package:notes_app/Widgets/Custom_note_item.dart';

class CustomListOfNotes extends StatelessWidget {
  const CustomListOfNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ReadNotesCubit, readNotesStates>(
        builder: (context, state) {
          List<NotesModel> notesModelList =
              BlocProvider.of<ReadNotesCubit>(context).notesModelList ?? [];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: notesModelList.length,
              itemBuilder: (context, index) {
                return CustomNoteItem(notesModelObject: notesModelList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
