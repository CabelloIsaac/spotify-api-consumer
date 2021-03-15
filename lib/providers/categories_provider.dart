import 'package:flutter/material.dart';
import 'package:spotify_api_consumer/models/spotify/categories_response.dart';
import 'package:spotify_api_consumer/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CategoriesProvider extends ChangeNotifier {
  List<Item> _items = [];
  Item _item;

  CategoriesProvider.instance() {
    fetchCategories();
  }

  List<Item> get items => _items;

  set items(List<Item> value) {
    _items = value;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    var url = Uri.https(
      'api.spotify.com',
      '/v1/browse/categories',
      {
        'country': 'CO',
        'locale': 'es-CO',
      },
    );

    try {
      var response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer BQCq4hTyULs_EFX_D6ENkgVtPZo_REwdZ7RFE9Xc2Bz7xedpweXtRWaWjWhx1mLDBaWg81_R_9W2CLrLY3dJf_Y_JyuiXb5j_eYJp1Hd8nl3L8SGlIx3mSaqbaC2BfaQ6xP6FroronH9XySmh5Uq3nzcJNyu9GYznIFPUpLNWMoOi1bP_9YFPqF-K3HJFVTsDey3szCg4R_VadFHtLXeSBOSySx5NRaZDZp2Ru0rqTl9sOmcYk2HozQPdTMxHBa2Xy_9Hlxi4kGTxAqPZonWpVHlxkLxB3MyeOrkavie',
      });
      print(response.body);
      if (response.statusCode == 200) {
        final json = convert.jsonDecode(response.body);

        final categoriesResponse =
            CategoriesResponse.fromJson(json["categories"]);

        items = categoriesResponse.items;
      }
    } catch (e) {
      print(e);
    }
  }
}
