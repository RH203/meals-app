import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/src/common/widget/buttons/primary_buttons.dart';
import 'package:meals_app/src/common/widget/fields/widget_text_field.dart';
import 'package:meals_app/src/constant/constant.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _validator(String? value) {
    // TODO: VALIDATOR
    return "";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                              text: 'Join ',
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
                              text: ' Discover new recipes today.',
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: WidgetTextField(
                                  label: "Firstname",
                                  hintText: "Firstname",
                                  validator: _validator,
                                  isPassword: false,
                                  controller: _firstnameController,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: WidgetTextField(
                                  label: "Lastname",
                                  hintText: "Lastname",
                                  validator: _validator,
                                  isPassword: false,
                                  controller: _lastnameController,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          WidgetTextField(
                            label: "Email",
                            hintText: "example@gmail.com",
                            validator: _validator,
                            isPassword: false,
                            controller: _emailController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          WidgetTextField(
                            label: "Password",
                            hintText: "Password",
                            validator: _validator,
                            isPassword: true,
                            controller: _passwordController,
                          )
                        ],
                      ),
                      PrimaryButtons(
                        title: "Sign Up",
                        onTap: () => context.go('/homescreen'),
                      ),
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
