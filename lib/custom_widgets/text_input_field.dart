import 'package:flutter/material.dart';

class textInputField extends StatelessWidget {
  textInputField(
      {Key? key,
        required this.nameController,
        required this.labelText,
        this.validator,
        required this.icon})
      : super(key: key);

  final TextEditingController nameController;
  String labelText;
  final Function(String?)? validator;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        controller: nameController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
            ),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.grey.shade600),
            prefixIcon: icon,
            focusColor: Colors.grey.shade300,
            prefixIconColor: Colors.grey.shade300),
        validator: (value) {
          if (value != null) {
            return validator!(value);
          }
          return null;
        },
      ),
    );
  }
}