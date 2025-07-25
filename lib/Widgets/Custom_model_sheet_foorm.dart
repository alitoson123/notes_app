import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/Cubits/add_notes_cubit/add_notes_states.dart';
import 'package:notes_app/Cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/Models/notes_model.dart';
import 'package:notes_app/Widgets/Custom_Colors_list_view.dart';
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
            padding: EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: MediaQuery.of(context).viewInsets.bottom),
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
                  height: 12,
                ),
                CustomColorsListView(),
                SizedBox(
                  height: 12,
                ),
                BlocBuilder<AddNotesCubit, addNotesStates>(
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: State is addLoadingStates ? true : false,
                      textbutton: 'Add',
                      onpressed: () {
                        if (mykey.currentState!.validate()) {
                          mykey.currentState!.save();

                          var notemodelObject = NotesModel(
                            title: title!,
                            subtitle: subtitle!,
                            date: DateTime.now().toString(),
                          //  color: Colors.blue.value,
                          );

                          BlocProvider.of<AddNotesCubit>(context)
                              .addNotesMethod(notesmodel: notemodelObject);
                          BlocProvider.of<ReadNotesCubit>(context)
                              .readNotesMethod();
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
