import 'package:flutter/material.dart';
import 'package:juju30ans/colors.dart';

class JujuEditText extends StatelessWidget {
  final void Function() onValidatePressed;
  final TextEditingController controller;
  final String hint;

  const JujuEditText({
    required this.onValidatePressed,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: JujuColors.editTextBorder,
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: TextFormField(
            style: const TextStyle(fontFamily: "Popins", fontSize: 18),
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (value) {
              onValidatePressed();
            },
            controller: controller,
            decoration: InputDecoration.collapsed(hintText: hint),
          ),
        ),
      ),
    );
  }
}
