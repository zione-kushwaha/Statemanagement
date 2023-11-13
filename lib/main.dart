import 'package:core_statemanagement/provider/cart.dart';
import 'package:core_statemanagement/provider/products.dart';
import 'package:core_statemanagement/screen/cart_screen.dart';

import '/screen/product_overiew_screen.dart';
import 'package:flutter/material.dart';
import './screen/product_screen_detail.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => products(),
        ),
        ChangeNotifierProvider(
          create: (_) => cart(),
        )
      ],
      child: MaterialApp(
        home: product_over_view(),
        routes: {
          product_detail_screen.router_name: (ctx) => product_detail_screen(),
          CartScreen.RouteName: (context) => CartScreen()
        },
      ),
    );
  }
}
