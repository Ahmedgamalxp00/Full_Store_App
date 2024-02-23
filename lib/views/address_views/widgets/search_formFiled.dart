import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';

class SearchFormFiled extends StatelessWidget {
  const SearchFormFiled({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      controller: controller,
      cursorColor: kTextColor,
      decoration: const InputDecoration(
          hintText: 'Search Places',
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: Colors.transparent)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: Colors.transparent))),
    );
  }
}
