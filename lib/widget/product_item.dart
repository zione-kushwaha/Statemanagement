import 'package:core_statemanagement/provider/cart.dart';
import 'package:core_statemanagement/provider/product.dart';
import 'package:core_statemanagement/screen/product_screen_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class product_item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart_provider = Provider.of<cart>(context, listen: false);
    final loaded_product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(product_detail_screen.router_name,
                  arguments: loaded_product.id);
            },
            child: Image(
              image: NetworkImage(
                loaded_product.imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              loaded_product.title,
              textAlign: TextAlign.center,
            ),
            leading: Consumer<Product>(builder: (context, val, child) {
              return IconButton(
                  onPressed: () {
                    val.tooggle();
                  },
                  icon: val.isfavorate
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(Icons.favorite));
            }),
            trailing: IconButton(
                onPressed: () {
                  cart_provider.add_item(loaded_product.id,
                      loaded_product.title, loaded_product.price);
                },
                icon: Icon(Icons.shopping_cart)),
          )),
    );
  }
}
