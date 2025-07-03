import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/Cubits/add_notes_cubit/add_notes_states.dart';
import 'package:notes_app/Models/notes_model.dart';

class AddNotesCubit extends Cubit<addNotesStates> {
  AddNotesCubit() : super(addInitialStates());
  Color color = Color(0xffF1EFEC);
  void addNotesMethod({required NotesModel notesmodel}) async {
    notesmodel.color = color.value;
    emit(addLoadingStates());
    try {
      var hiveBox = Hive.box<NotesModel>('notes_box');
      await hiveBox.add(notesmodel);
      emit(addSuccessStates());
    } catch (e) {
      emit(
        addfailedStates(
          messageError: e.toString(),
        ),
      );
    }
  }
}
