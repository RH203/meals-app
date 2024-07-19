import 'package:flutter/material.dart';
import 'package:meals_app/src/common/widget/fields/widget_text_field.dart';
import 'package:meals_app/src/constant/constant.dart';
import 'package:meals_app/src/utils/app_logger.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController _searchController = TextEditingController();

  String _validator(String? value) {
    // TODO: VALIDATOR
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: CustomScrollView(
            slivers: [
              // Welcome widget
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
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
                      WidgetTextField(
                        label: "Search",
                        hintText: "Nasi padang",
                        validator: _validator,
                        isPassword: false,
                        controller: _searchController,
                      ),
                    ],
                  ),
                ),
              ),
              // Trending recipe
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(top: 70),
                  height: 315,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Trending Recipes",
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
                      Expanded(
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                          ),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: Colors.red[(index + 1) * 100],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    width: 300,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        "assets/image/dummy_product/image.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Dish Title",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet consectetur. Urna nibh amet consectetur metus gravida. Phasellus erat tristique massa.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
