import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final Function()? showPass;
  final TextEditingController textEditingController;

  const DefaultTextFormField(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      required this.textEditingController,
      this.obscureText,
      this.suffixIcon,
      this.showPass});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: textEditingController,
      decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon),
                  onPressed: showPass ?? () {},
                )
              : null,
          hintText: hintText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      onChanged: (value) {},
    );
  }
}
