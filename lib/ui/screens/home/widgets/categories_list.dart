import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_consumer/models/spotify/categories_response.dart';
import 'package:spotify_api_consumer/providers/categories_provider.dart';
import 'package:spotify_api_consumer/ui/screens/categories/category_details_screen.dart';

import 'home_list_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _buildCategoryItemsList(context, categoriesProvider),
      ),
    );
  }

  List<Widget> _buildCategoryItemsList(
      BuildContext context, CategoriesProvider categoriesProvider) {
    List<Widget> widgets = [SizedBox(width: 20)];
    widgets.addAll(categoriesProvider.items.map((e) => HomeListItem(
          imageUrl: e.icons.first.url,
          onTap: () {
            categoriesProvider.category = e;
            Navigator.pushNamed(context, CategoryDetailsScreen.route);
          },
          title: e.name,
        )));
    return widgets;
  }
}
