import 'package:core_statemanagement/provider/cart.dart';
import 'package:core_statemanagement/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
import '../widget/grid_view_builder.dart';
import '../widget/badge.dart';

enum filter_option { favoriate, all }

class product_over_view extends StatefulWidget {
  product_over_view({super.key});

  @override
  State<product_over_view> createState() => _product_over_viewState();
}

class _product_over_viewState extends State<product_over_view> {
  final List<Product> loaded_product = [];

  bool favoriate_only = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My shop'),
        centerTitle: true,
        actions: [
          Consumer<cart>(builder: (context, value, child) {
            return Badges(
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CartScreen.RouteName);
                    },
                    icon: Icon(Icons.shopping_cart)),
                value: value.get_count.toString());
          }),
          PopupMenuButton(
              onSelected: (filter_option val) {
                setState(() {
                  if (val == filter_option.favoriate) {
                    favoriate_only = true;
                  } else {
                    favoriate_only = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('only  favoriate'),
                      value: filter_option.favoriate,
                    ),
                    PopupMenuItem(
                      child: Text('show all'),
                      value: filter_option.all,
                    )
                  ]),
        ],
      ),
      body: GridViewBuilder(fav: favoriate_only),
    );
  }
}
