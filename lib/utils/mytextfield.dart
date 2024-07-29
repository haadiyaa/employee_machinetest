import 'package:flutter/material.dart';
import 'package:machinetest_web/resources/appcolors.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    required this.text,
    required this.textEditingController,
    this.validator,
    this.obscureText = false,
  });
  final String text;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        obscureText: obscureText,
        controller: textEditingController,
        decoration: InputDecoration(
          suffixIcon: obscureText
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                      // ? Icons.visibility
                      Icons.visibility_off),
                )
              : null,
          filled: true,
          fillColor: AppColors.bgColor,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: text,
        ),
      ),
    );
  }
}
