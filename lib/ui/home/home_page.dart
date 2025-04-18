import 'package:flutter/material.dart';
import 'package:imersao_mobile/data/categories_data.dart';
import 'package:imersao_mobile/ui/home/widgets/category_widget.dart';
import 'package:imersao_mobile/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';

import '../../_core/configs/theme/app_colors.dart';
import '../../data/restaurant_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.lightBackgroundColor,
            child: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Center(child: Image.asset('assets/logo.png', width: 147)),
              Text("Boas-vindas"),
              TextFormField(),
              Text("Escolha por categoria"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.0,
                  children: List.generate(
                    CategoriesData.listCategories.length,
                    (index) {
                      return CategoryWidget(
                        category: CategoriesData.listCategories[index],
                      );
                    },
                  ),
                ),
              ),
              Image.asset('assets/banners/banner_promo.png'),
              Text("Bem avaliados"),
              Column(
                spacing: 16.0,
                children: List.generate(
                  restaurantData.listRestaurants.length,
                  (index) => RestaurantWidget(
                    restaurant: restaurantData.listRestaurants[index],
                  ),
                ),
              ),
              SizedBox(height: 64.0),
            ],
          ),
        ),
      ),
    );
  }
}
