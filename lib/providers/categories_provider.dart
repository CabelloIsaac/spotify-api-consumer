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
            'Bearer BQCc5joMP1Buzv1GHPOcKj_BFyhfJbhqVMWzOKFgVxzEbLkozm4zRAh0dJ3M_x35Jwe_mm8IIyIXIeXYwYKG6nvuz5U57KHheX48y0HByYDFH5S5U9Dn9nKKewYd44EeuM8WRkWDEa9ZOkBFC6s48HcAplCa3zNuazT8y8i_6KDxKBCWBOWDaI34w14HuiALEyM-LeQdkccU-zHwswAU6_lLbFvyFMKciWNrGhW6_g00csU9jGffyYBKsYh0kdeQXlfnm7F123EL5-OGEOySoEnu_3DEHPPr2NirH0KC',
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
