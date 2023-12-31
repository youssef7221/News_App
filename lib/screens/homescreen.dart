import 'package:flutter/material.dart';
import 'package:news_app/models/categoriesdm.dart';
import 'package:news_app/screens/newappbar.dart';
import 'package:news_app/provider/settings_provider.dart';
import 'package:news_app/screens/categoriesScreen/categories_screen.dart';
import 'package:news_app/screens/settings/settings.dart';
import 'package:provider/provider.dart';
import '../api_manager/api_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../constants/appcolors.dart';
import 'Drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'newsScreen/Tabbarcontroller.dart';
class HomeScreen extends StatefulWidget {
  static String route = "HomeScreen";
  int index = 1;
  bool isSearch = false;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => settingsProvider(),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/pattern.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: MyAppBar(),
          drawer: Drawerscreen(selectedDrawer),

          body:  FutureBuilder(future: ApiManager.getsources(_categoryDm?.categoryId??""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
              {
                return Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                      color: AppColors.primary,
                      size: 100,
                    )
                );
              }
              if (snapshot.hasError)
              {
                return Center(child: Text("Something went wrong"));
              }
              var sources = snapshot.data?.sources ?? [];
              var taps = [
                TabbarController(sources),
                CategoriesScreen(getCategory),
                SettingsScreen(),
              ];
              return taps[widget.index];
            },),
        ),
      ),
    );
  }
  CategoryDm? _categoryDm = null;
  void getCategory(categoryDm){
    _categoryDm = categoryDm;
    widget.index = 0;
    setState(() {});
  }

  void selectedDrawer(number){
     if(number == 1)
       {  widget.index = 1;
         _categoryDm = null;
         setState(() {});
         Navigator.pop(context);
       }
     if(number == 2)
       { widget.index = 2;
         Navigator.pop(context);
         setState((){});
       }
  }
}
