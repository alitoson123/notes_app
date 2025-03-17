class addNotesStates {}

class addInitialStates extends addNotesStates {}

class addLoadingStates extends addNotesStates {}

class addSuccessStates extends addNotesStates {}

class addfailedStates extends addNotesStates {
  final String messageError;

  addfailedStates({required this.messageError});
}
