import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/add_notes_cubit/add_notes_states.dart';
import 'package:notes_app/Models/notes_model.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(initialStates());

  void addNotesModel({required NotesModel notesmodel})
  {

  }
}
