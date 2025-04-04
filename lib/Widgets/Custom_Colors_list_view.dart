import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomColorsListView extends StatefulWidget {
  const CustomColorsListView({super.key});

  @override
  State<CustomColorsListView> createState() => _CustomColorsListViewState();
}

class _CustomColorsListViewState extends State<CustomColorsListView> {
  int currentIndex = 0;
  List<Color> ColorList = [
    Color(0xffF1EFEC),
    Color(0xffD4C9BE),
    Color(0xff123458),
    Color(0xff030303)
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
