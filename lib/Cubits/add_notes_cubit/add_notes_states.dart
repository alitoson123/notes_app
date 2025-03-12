class NotesStates {}

class initialStates extends NotesStates {}

class NotesLoadingStates extends NotesStates {}

class NotesSuccessStates extends NotesStates {}

class NotesfailedStates extends NotesStates {
  final String messageError;

  NotesfailedStates({required this.messageError});
}
