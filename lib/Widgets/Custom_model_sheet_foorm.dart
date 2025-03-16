import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/Cubits/add_notes_cubit/add_notes_states.dart';
import 'package:notes_app/Models/notes_model.dart';
import 'package:notes_app/Widgets/Custom_text_field.dart';
import 'package:notes_app/Widgets/custom_button.dart';

class CustomModelSheetFoorm extends StatefulWidget {
  const CustomModelSheetFoorm({
    super.key,
  });

  @override
  State<CustomModelSheetFoorm> createState() => _CustomModelSheetFoormState();
}

String? title, subtitle;
GlobalKey<FormState> mykey = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class _CustomModelSheetFoormState extends State<CustomModelSheetFoorm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: mykey,
        autovalidateMode: autovalidateMode,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  hintText: 'title',
                  maxsize: 1,
                  onChanged: (value) {
                    title = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: 'content',
                  maxsize: 5,
                  onChanged: (value) {
                    subtitle = value;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                BlocBuilder<NotesCubit, NotesStates>(
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: State is NotesLoadingStates ? true : false,
                      textbutton: 'Add',
                      onpressed: () {
                        if (mykey.currentState!.validate()) {
                          mykey.currentState!.save();

                          var notemodelObject = NotesModel(
                              title: title!,
                              subtitle: subtitle!,
                              date: DateTime.now().toString(),
                              color: Colors.blue.hashCode);

                          BlocProvider.of<NotesCubit>(context)
                              .addNotesMethod(notesmodel: notemodelObject);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
