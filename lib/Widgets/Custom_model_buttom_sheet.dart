import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/Cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/Cubits/add_notes_cubit/add_notes_states.dart';
import 'package:notes_app/Widgets/Custom_model_sheet_foorm.dart';

class CustomModelButtomSheet extends StatefulWidget {
  const CustomModelButtomSheet({super.key});

  @override
  State<CustomModelButtomSheet> createState() => _CustomModelButtomSheetState();
}

class _CustomModelButtomSheetState extends State<CustomModelButtomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: BlocConsumer<NotesCubit, NotesStates>(
        listener: (context, state) {
          if (state is NotesSuccessStates) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('The notes is added successfully'),
              ),
            );
            if (state is NotesfailedStates) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('failed, please try again'),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          return CustomModelSheetFoorm();
        },
      ),
    );
  }
}
