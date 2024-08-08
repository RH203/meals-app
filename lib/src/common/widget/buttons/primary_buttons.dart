import 'package:flutter/material.dart';
import 'package:meals_app/src/constant/constant.dart';

class PrimaryButtons extends StatefulWidget {
  const PrimaryButtons({
    super.key,
    required this.onTap,
    required this.title,
  });

  final String title;
  final void Function()? onTap;

  @override
  State<PrimaryButtons> createState() => _PrimaryButtonsState();
}

class _PrimaryButtonsState extends State<PrimaryButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constant.darkRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Color.fromARGB(255, 190, 54, 54),
          borderRadius: BorderRadius.circular(20),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Constant.warmWhite,
                  fontSize: 30,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
