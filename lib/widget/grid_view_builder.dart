import 'package:core_statemanagement/provider/products.dart';
import 'package:flutter/material.dart';
import '../widget/product_item.dart';
import 'package:provider/provider.dart';

class GridViewBuilder extends StatelessWidget {
  final bool fav;
  GridViewBuilder({required this.fav});

  @override
  Widget build(BuildContext context) {
    final loadedProducts = Provider.of<products>(context);
    final productsData =
        fav ? loadedProducts.favoriate_item : loadedProducts.item;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: loadedProducts, // Provide the products instance
        ),
      ],
      child: GridView.builder(
        itemCount: productsData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: productsData[i], // Provide the individual product
          child: product_item(),
        ),
      ),
    );
  }
}
