import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat_app/const.dart';

class text_field extends StatelessWidget {
  text_field(
      {super.key,
      required this.hint_text,
      this.onChanged,
      this.obscureText = false});

  Function(String)? onChanged;
  String hint_text;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    hint_text = hint_text;
    return SizedBox(
      width: 375,
      child: TextFormField(
        obscureText: obscureText!,
        validator: (data) {
          if (data!.isEmpty) {
            return 'Field is required';
          }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint_text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kgry),
          ),
        ),
      ),
    );
  }
}
