import 'package:flutter/material.dart';
import 'package:full_store_app/core/utils/app_styles.dart';

class Customformfield extends StatelessWidget {
  const Customformfield(
      {super.key,
      required this.hint,
      this.suffixIcon,
      this.prefixIcon,
      required this.controller,
      this.validator,
      this.obscuretext = false,
      this.onSuffixTap});
  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscuretext;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? onSuffixTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretext,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF3F3F3),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
        prefixIcon: Icon(
          prefixIcon,
          size: 27,
        ),
        suffixIcon: GestureDetector(
          onTap: onSuffixTap,
          child: Icon(
            suffixIcon,
            size: 27,
          ),
        ),
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hint,
        hintStyle: AppStyles.styleMedium12.copyWith(fontSize: 16),
      ),
    );
  }
}
