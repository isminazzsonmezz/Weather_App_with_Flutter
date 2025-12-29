import 'package:flutter/material.dart';
import 'package:weather_app_with_flutter/Pages/GridView.dart';
import 'package:weather_app_with_flutter/Pages/Json_Api_Future.dart';
import 'package:weather_app_with_flutter/Pages/Json_Data_with_DioPack.dart';
import 'package:weather_app_with_flutter/Pages/List_and_Data_Processing.dart';
import 'package:weather_app_with_flutter/enums/menu_items.dart';
import 'package:weather_app_with_flutter/main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBack, // Hero'yu kapatır
      /*
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          debugPrint("Cancel");
        },
      ),
      */
      title: Text(title),
      // backgroundColor: Colors.amber,
      centerTitle: true,
      actions: [
        PopupMenuButton<MenuItemType>(
          onSelected: (item) {
            if (item == MenuItemType.ListAndData) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyListandDataProcessing(),
                ),
              );
            } else if (item == MenuItemType.GridView) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyGridView()),
              );
            } else if (item == MenuItemType.JsonApiBuilder) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyJsonApiFutureBuilder(),
                ),
              );
            } else if (item == MenuItemType.Json_with_Dio) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyDioPackage()),
              );
            } else if (item == MenuItemType.WeatherApp) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyWeatherApp()),
              );
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: MenuItemType.ListAndData,
              child: Text('List and Data Processing'),
            ),
            const PopupMenuItem(
              value: MenuItemType.GridView,
              child: Text('GridView'),
            ),
            const PopupMenuItem(
              value: MenuItemType.JsonApiBuilder,
              child: Text('Json_Api_Builder'),
            ),
            const PopupMenuItem(
              value: MenuItemType.Json_with_Dio,
              child: Text('Json_with_DioPack'),
            ),
            const PopupMenuItem(
              value: MenuItemType.WeatherApp,
              child: Text('Weather App'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
