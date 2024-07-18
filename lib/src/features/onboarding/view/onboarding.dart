import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/src/common/widget/page_view/onboarding_view.dart';
import 'package:meals_app/src/constant/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _pageController = PageController();
  int _indexPage = 0;

  void _onPageChange() {
    if (_pageController.page != 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 670),
        curve: Curves.easeInOut,
      );
    } else {
      // Go next page
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Constant.warmWhite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _indexPage = value;
                      });
                    },
                    children: <Widget>[
                      const OnboardingView(index: 0)
                          .animate()
                          .slideY(duration: 800.ms),
                      const OnboardingView(index: 1)
                          .animate()
                          .slideY(duration: 800.ms),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: _indexPage != 1
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: <Widget>[
                      Visibility(
                        visible: _indexPage != 1,
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: 2,
                          effect: const ExpandingDotsEffect(
                            dotColor: Colors.grey,
                            activeDotColor: Constant.darkRed,
                          ),
                        ),
                      ),
                      _indexPage == 1
                          ? TextButton(
                              onPressed: () => context.go('/sign-in'),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                              ),
                              child: const Text(
                                "Get Started",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ).animate().fadeIn().scale()
                          : IconButton(
                              onPressed: _onPageChange,
                              icon: const Icon(
                                Icons.keyboard_arrow_right_rounded,
                                size: 40,
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
