import 'package:flutter/material.dart';
import 'package:meals_app/src/constant/constant.dart';

class WidgetTextField extends StatefulWidget {
  const WidgetTextField(
      {super.key,
      required this.label,
      required this.hintText,
      required this.validator,
      required this.isPassword,
      required this.controller});

  final String label, hintText;
  final String Function(String?) validator;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<WidgetTextField> createState() => _WidgetTextFieldState();
}

class _WidgetTextFieldState extends State<WidgetTextField> {
  bool _show = true;

  void _showPassword() {
    setState(() {
      _show = !_show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isPassword ? _show : false,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: _showPassword,
                icon: _show
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              )
            : null,
        label: Text(widget.label),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Constant.blackishGrey, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Constant.blackishGrey, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Constant.darkRed, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Constant.brightRed, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Constant.blackishGrey,
            width: 2,
          ),
        ),
      ),
    );
  }
}
