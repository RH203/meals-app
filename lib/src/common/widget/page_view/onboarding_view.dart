import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meals_app/src/constant/constant.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final List<RichText> titles = [
    RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(
          fontSize: 18,
          color: Constant.blackishGrey,
          fontFamily: 'Montserrat',
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Welcome to ',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: 'RecipeMaster!',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: Constant.darkRed,
            ),
          ),
          TextSpan(
            text: ' Discover delicious recipes tailored to your taste.',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
    RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(
          fontSize: 18,
          color: Constant.blackishGrey,
          fontFamily: 'Montserrat',
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Get started with ',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: 'RecipeMaster',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: Constant.darkRed,
            ),
          ),
          TextSpan(
            text:
                ' and explore a world of culinary delights at your fingertips.',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  ];

  final List<String> lottie = [
    "assets/lottie/animation-1.json",
    "assets/lottie/animation-2.json"
  ];

  @override
  Widget build(BuildContext context) {
    return widget.index == 0
        ? Column(
            children: [
              Lottie.asset(
                lottie[widget.index],
              ),
              const SizedBox(
                height: 20,
              ),
              titles[widget.index]
            ],
          )
        : Column(
            children: [
              Lottie.asset(
                lottie[widget.index],
              ),
              const SizedBox(
                height: 20,
              ),
              titles[widget.index]
            ],
          );
  }
}
