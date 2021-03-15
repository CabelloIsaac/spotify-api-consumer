import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_consumer/models/spotify/categories_response.dart';
import 'package:spotify_api_consumer/providers/categories_provider.dart';

import 'home_list_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    final categories = categoriesProvider.items;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _buildCategoryItemsList(categories),
      ),
    );
  }

  List<Widget> _buildCategoryItemsList(List<Item> categories) {
    List<Widget> widgets = [SizedBox(width: 20)];
    widgets.addAll(categories.map((e) => HomeListItem(
          imageUrl: e.icons.first.url,
          onTap: () {},
          title: e.name,
        )));
    return widgets;
  }
}
