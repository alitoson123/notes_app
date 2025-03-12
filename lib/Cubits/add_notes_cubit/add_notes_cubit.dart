import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/add_notes_cubit/add_notes_states.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(initialStates());
}
