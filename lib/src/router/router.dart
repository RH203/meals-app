import 'package:go_router/go_router.dart';
import 'package:meals_app/src/features/authentication_page/views/sign_in.dart';
import 'package:meals_app/src/features/authentication_page/views/sign_up.dart';
import 'package:meals_app/src/features/homescreen/views/homescreen.dart';
import 'package:meals_app/src/features/onboarding/view/onboarding.dart';
import 'package:meals_app/src/features/search_page/views/search_page.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        path: '/homescreen',
        builder: (context, state) => const Homescreen(),
      ),
      // Auth
      GoRoute(
        path: '/sign-in',
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        path: '/sign-up',
        builder: (context, state) => const SignUp(),
      ),
      GoRoute(
        path: '/search-page',
        builder: (context, state) => const SearchPage(),
      )
    ],
  );
}
