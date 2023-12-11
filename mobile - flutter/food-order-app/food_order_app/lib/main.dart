import 'package:flutter/material.dart';
import 'package:food_order_app/provider/restaurant_provider.dart';
import 'package:food_order_app/routers/navigation_router.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/theme_data_helper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Food_Order_App());
}

class Food_Order_App extends StatelessWidget {
  const Food_Order_App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestaurantProvider>(
          create: (BuildContext context) {
            return RestaurantProvider();
          },
        ),
      ],
      child: MaterialApp(
        title: "Food Order App",
        debugShowCheckedModeBanner: false,
        theme: ThemeDataHelper.pinkAccentThemeData(),
        onGenerateRoute: NavigationRouter.generateRoute,
        initialRoute: NavigationRouter.getInitialRoute(),
      ),
    );
  }
}
