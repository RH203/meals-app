import 'package:flutter/material.dart';
import 'package:meals_app/src/common/widget/fields/widget_text_field.dart';
import 'package:meals_app/src/constant/constant.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/src/utils/app_logger.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  String _validator(String? value) {
    return "";
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                backgroundColor: Constant.warmWhite,
                surfaceTintColor: Constant.warmWhite,
                elevation: 0,
                leading: IconButton(
                  onPressed: () => context.go('/homescreen'),
                  style: IconButton.styleFrom(
                    padding: const EdgeInsets.all(5),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Constant.darkRed,
                  ),
                  icon: const Icon(Icons.arrow_back),
                ),
                title: Text(
                  "Explore recipes easily.",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: WidgetTextField.search(
                    label: "Search",
                    hintText: "Search",
                    validator: _validator,
                    isPassword: false,
                    searchFunction: () =>
                        AppLogger.debug("${_searchController.text}"),
                    controller: _searchController,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
