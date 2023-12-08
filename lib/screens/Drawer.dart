import 'package:flutter/material.dart';
import 'package:news_app/constants/appcolors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Drawerscreen extends StatelessWidget{
  Function selectedDrawer ;
  int Categories = 1;
  int Settings = 2;
  Drawerscreen(this.selectedDrawer);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * .6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            color: AppColors.primary,
            child: Text(
              AppLocalizations.of(context)!.news,
              style: TextStyle(color: Colors.white, fontSize: 26),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              selectedDrawer(Categories);
            },
            child: Row(
              children: [
                Icon(Icons.category, size: 50),
                SizedBox(
                  width: 15,
                ),
                Text("Categories")
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
              onTap: () {
                selectedDrawer(Settings);
              },
              child: Row(
              children: [
                Icon(Icons.settings, size: 50),
                SizedBox(
                  width: 15,
                ),
                Text("Settings")
              ],
            ),
          )
        ],
      ),
    );
  }
}
