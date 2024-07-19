import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/src/common/widget/fields/widget_text_field.dart';
import 'package:meals_app/src/constant/constant.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _validator(String? value) {
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(8, constraints.maxHeight * 0.1, 8, 8),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: Theme.of(context).textTheme.headlineMedium,
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Welcome back to ',
                            ),
                            TextSpan(
                              text: 'Mealify!',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: Constant.darkRed,
                                  ),
                            ),
                            const TextSpan(
                              text: ' Ready to cook?',
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          WidgetTextField(
                            label: "Email",
                            hintText: "example@gmail.com",
                            validator: _validator,
                            isPassword: false,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          WidgetTextField(
                            label: "Password",
                            hintText: "Password",
                            validator: _validator,
                            isPassword: true,
                          )
                        ],
                      ),
                      TextButton(
                        onPressed: () => context.go('/sign-up'),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 10,
                          ),
                        ),
                        child: Text(
                          "Sign in",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 25,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    color: Constant.warmWhite,
                                  ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
