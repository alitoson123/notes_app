import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/Custom_model_buttom_sheet.dart';
import 'package:notes_app/Widgets/custom_notes_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomNotesBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Color(0xff323232),
            context: context,
            builder: (context) {
              return CustomModelButtomSheet();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
