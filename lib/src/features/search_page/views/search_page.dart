import 'package:flutter/material.dart';
import 'package:meals_app/src/common/widget/cards/menu_cards.dart';
import 'package:meals_app/src/common/widget/fields/widget_text_field.dart';
import 'package:meals_app/src/constant/constant.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/src/features/homescreen/models/detail_meal_model.dart';
import 'package:meals_app/src/injection/injection.dart';
import 'package:meals_app/src/service/service_api.dart';
import 'package:meals_app/src/utils/app_logger.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<DetailMealModel> _data = [];

  String _validator(String? value) {
    return "";
  }

  void _onSubmit() async {
    List<DetailMealModel> respon = await getIt<ServiceApi>()
        .searchMealByName(_searchController.text, Constant.searchByName);
    setState(() {
      if (_data.isNotEmpty) _data = [];
      if (respon.isNotEmpty) {
        _data.addAll(respon);
      }
      ;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  searchFunction: _onSubmit,
                  controller: _searchController,
                ),
              ),
            ),
            SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisExtent: 300,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: _data.length,
              itemBuilder: (context, index) {
                final _item = _data[index];
                return Container(
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: MenuCards(
                    onTap: () {},
                    image: _item.mealImage,
                    title: _item.nameMeal,
                    tags: _item.mealTags,
                    country: _item.mealRegion,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
