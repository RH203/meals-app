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
  final List<String> lottie = [
    "assets/lottie/animation-1.json",
    "assets/lottie/animation-2.json"
  ];

  @override
  Widget build(BuildContext context) {
    final List<RichText> titles = [
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.headlineMedium,
          children: <TextSpan>[
            const TextSpan(
              text: 'Welcome to ',
            ),
            TextSpan(
              text: 'Mealify!',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Constant.darkRed,
                  ),
            ),
            const TextSpan(
              text: ' Discover delicious recipes tailored to your taste.',
            ),
          ],
        ),
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.headlineMedium,
          children: <TextSpan>[
            const TextSpan(
              text: 'Get started with ',
            ),
            TextSpan(
              text: 'Mealify',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Constant.darkRed,
                  ),
            ),
            const TextSpan(
              text:
                  ' and explore a world of culinary delights at your fingertips.',
            ),
          ],
        ),
      ),
    ];

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
