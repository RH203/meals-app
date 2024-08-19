import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/src/constant/constant.dart';
import 'package:meals_app/src/features/homescreen/views/category_screen.dart';
import 'package:meals_app/src/features/homescreen/views/homescreen_menu.dart';
import 'package:meals_app/src/utils/app_logger.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              backgroundColor: Constant.warmWhite,
              surfaceTintColor: Constant.warmWhite,
              elevation: 0,
              leading: IconButton.outlined(
                onPressed: () {},
                style: IconButton.styleFrom(
                  padding: const EdgeInsets.all(5),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Constant.darkRed,
                ),
                icon: const Icon(Icons.person),
              ),
              actions: <Widget>[
                IconButton.outlined(
                  onPressed: () => context.go('/search-page'),
                  style: IconButton.styleFrom(
                    padding: const EdgeInsets.all(5),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Constant.darkRed,
                  ),
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                )
              ],
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello Raihan!",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    "What would you like to make ?",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Category",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        AppLogger.debug("View all pressed");
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: Constant.warmWhite,
                      ),
                      child: Text(
                        "View All",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const CategoryScreen(),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Recipe of the day",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        AppLogger.debug("View all pressed");
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: Constant.warmWhite,
                      ),
                      child: Text(
                        "View All",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            HomescreenMenu()
          ],
        ),
      ),
    );
  }
}
