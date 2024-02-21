import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';

class ColorSection extends StatefulWidget {
  const ColorSection({super.key});

  @override
  State<ColorSection> createState() => _ColorSectionState();
}

class _ColorSectionState extends State<ColorSection> {
  int selectedColor = 0;

  List<Color> colorList = [
    const Color(0xffd11141),
    const Color(0xff00b159),
    const Color(0xff00aedb),
    const Color(0xfff37735),
    const Color(0xffffc425),
    const Color(0x000000ff),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              colorList.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = index;
                  });
                },
                child: colorItem(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget colorItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Stack(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color:
                    selectedColor == index ? kPrimeryColor : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: colorList[index],
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
