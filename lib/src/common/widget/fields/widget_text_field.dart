import 'package:flutter/material.dart';

class WidgetTextField extends StatefulWidget {
  const WidgetTextField({super.key});

  @override
  State<WidgetTextField> createState() => _WidgetTextFieldState();
}

class _WidgetTextFieldState extends State<WidgetTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: const Text("Email"),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        hintText: "example@gmail.com",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
