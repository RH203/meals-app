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

              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
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

              SliverToBoxAdapter(
                child: SizedBox(
                  height: 120,
                  child: GridView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    itemBuilder: (context, index) {
                      AppLogger.debug("Item: $index");
                      return Column(
                        children: <Widget>[
                          ClipOval(
                            child: Image.asset(
                              "assets/image/dummy_product/image.png",
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "Category Title",
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),

              // Trending recipe
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
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
              ),

              SliverToBoxAdapter(
                child: SizedBox(
                  height: 270,
                  child: GridView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      AppLogger.debug("Item: $index");
                      return Column(
                        children: <Widget>[
                          SizedBox(
                            width: 270,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              child: Image.asset(
                                "assets/image/dummy_product/image.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            "Dish Title",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet consectetur. Urna nibh amet consectetur metus gravida. Phasellus erat tristique massa.",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          )
                        ],
                      );
                    },
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
