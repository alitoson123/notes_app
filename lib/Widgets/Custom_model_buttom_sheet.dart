import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/Custom_text_field.dart';
import 'package:notes_app/Widgets/custom_button.dart';

class CustomModelButtomSheet extends StatefulWidget {
  const CustomModelButtomSheet({super.key});

  @override
  State<CustomModelButtomSheet> createState() => _CustomModelButtomSheetState();
}

class _CustomModelButtomSheetState extends State<CustomModelButtomSheet> {
  String? title, subtitle;
  GlobalKey<FormState> mykey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
                CustomButton(
                  textbutton: 'Add',
                  onpressed: () {
                    if (mykey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added'),
                        ),
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
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
