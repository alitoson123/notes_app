import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/Widgets/Custom_list_of_notes.dart';
import 'package:notes_app/Widgets/custom_app_bar.dart';

class CustomNotesBody extends StatelessWidget {
  const CustomNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ReadNotesCubit>(context).readNotesMethod();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          CustomAppBar(
            text: 'Notes',
            icon: Icons.search,
          ),
          CustomListOfNotes(),
        ],
      ),
    );
  }
}
