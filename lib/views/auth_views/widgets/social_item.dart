import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Socialitem extends StatelessWidget {
  const Socialitem({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      padding: const EdgeInsets.all(15),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFFBF3F5),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFF73658)),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
