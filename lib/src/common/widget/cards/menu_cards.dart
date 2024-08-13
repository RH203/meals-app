import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MenuCards extends StatefulWidget {
  const MenuCards({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
    required this.tags,
    required this.country,
  });

  final void Function()? onTap;
  final String image, title, tags, country;

  @override
  State<MenuCards> createState() => _MenuCardsState();
}

class _MenuCardsState extends State<MenuCards> {
  List<String> _splitStringByComma(String input) {
    return input.split(",");
  }

  String _trimMealTitle(String meal) {
    return meal.length > 24 ? meal.replaceRange(24, null, " More") : meal;
  }

  RichText _buildMealTitle(String meal) {
    const int maxLength = 24;
    const String moreText = " More";

    if (meal.length > maxLength) {
      return RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
          children: <TextSpan>[
            TextSpan(
              text: meal.substring(0, maxLength),
            ),
            TextSpan(
              text: moreText,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
            ),
          ],
        ),
      );
    } else {
      return RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
          children: <TextSpan>[
            TextSpan(
              text: meal,
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> _tagsList = _splitStringByComma(widget.tags);

    int tagsToShow = _tagsList.length > 1 ? 2 : _tagsList.length;

    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 180,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: FadeInImage(
                    image: NetworkImage(widget.image),
                    placeholder: MemoryImage(kTransparentImage),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: _buildMealTitle(widget.title),
              ),
            ],
          ),
          Visibility(
            visible: widget.tags != "null",
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: _tagsList.take(tagsToShow).map(
                  (e) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: Chip(
                        labelPadding: EdgeInsets.all(2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: Text(
                          e,
                        ),
                        labelStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
