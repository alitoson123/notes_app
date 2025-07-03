import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/add_notes_cubit/add_notes_cubit.dart';

class CustomColorsListView extends StatefulWidget {
  const CustomColorsListView({super.key});

  @override
  State<CustomColorsListView> createState() => _CustomColorsListViewState();
}

class _CustomColorsListViewState extends State<CustomColorsListView> {
  int currentIndex = 0;
  List<Color> ColorList = [
    Color(0xff5e4fa2),
    Color(0xff3288bd),
    Color(0xff66c2a5),
    Color(0xffabdda4),
    Color(0xffe6f598),
    Color(0xfffee08b),
    Color(0xfffdae61),
    Color(0xfff46d43),
    Color(0xffd53e4f),
    Color(0xff9e0142),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ColorList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddNotesCubit>(context).color = ColorList[index];
              setState(() {});
            },
            child: CustomColorItem(
              isSelected: currentIndex == index ? true : false,
              color: ColorList[index],
            ),
          );
        },
      ),
    );
  }
}

class CustomColorItem extends StatelessWidget {
  const CustomColorItem(
      {super.key, required this.isSelected, required this.color});
  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected == true
        ? Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: CircleAvatar(
                backgroundColor: color,
                radius: 21,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CircleAvatar(
              backgroundColor: color,
              radius: 25,
            ),
          );
  }
}
