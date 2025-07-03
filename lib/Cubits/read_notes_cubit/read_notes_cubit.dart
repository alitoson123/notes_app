import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/Cubits/read_notes_cubit/read_notes_states.dart';
import 'package:notes_app/Models/notes_model.dart';

class ReadNotesCubit extends Cubit<readNotesStates> {
  ReadNotesCubit() : super(readInitialState());
  List<NotesModel>? notesModelList;

  readNotesMethod() {
    var hiveBox = Hive.box<NotesModel>('notes_box');
    notesModelList = hiveBox.values.toList();
    emit(readSuccessState());
  }
}
