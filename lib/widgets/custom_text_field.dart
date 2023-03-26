import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {
        this.hintText,
        this.onChanged,
        this.inputType,
      });
  String? hintText;
  Function(String)? onChanged;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: inputType,
        decoration: InputDecoration(
         hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
