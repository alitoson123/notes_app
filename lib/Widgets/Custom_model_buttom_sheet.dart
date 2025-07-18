import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/Cubits/add_notes_cubit/add_notes_states.dart';
import 'package:notes_app/Cubits/read_notes_cubit/read_notes_cubit.dart';
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
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, addNotesStates>(
        listener: (context, state) {
          if (state is addSuccessStates) {
            BlocProvider.of<ReadNotesCubit>(context).readNotesMethod();
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('The notes is added successfully'),
              ),
            );
            if (state is addfailedStates) {
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
