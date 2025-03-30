import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomColorsListView extends StatelessWidget {
  const CustomColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  height: 25*2,
                  child: ListView.builder(
                    scrollDirection:Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 25,
                        ),
                      );
                    },
                  ),
                );
  }
}