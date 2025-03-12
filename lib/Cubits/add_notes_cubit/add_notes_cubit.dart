import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/Cubits/add_notes_cubit/add_notes_states.dart';
import 'package:notes_app/Models/notes_model.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(initialStates());

  void addNotesMethod({required NotesModel notesmodel}) async {
    emit(NotesLoadingStates());
    try {
      var hiveBox = Hive.box<NotesModel>('notes_box');
      await hiveBox.add(notesmodel);
      emit(NotesSuccessStates());
    } catch (e) {
      emit(
        NotesfailedStates(
          messageError: e.toString(),
        ),
      );
    }
  }
}
