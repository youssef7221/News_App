import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/provider/settings_provider.dart';
import 'package:news_app/provider/settings_provider.dart';
import 'package:news_app/provider/settings_provider.dart';
import 'package:news_app/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constants/appcolors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  String? search ;
  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: AppColors.primary,
      title: PreferredSize(
          preferredSize: Size.fromWidth(160),
          child:Consumer<settingsProvider>(builder: (context, settingsProvider, child) {
        if (settingsProvider.shouldsearch){
          return Container(
            width:MediaQuery.of(context).size.width - 100,
            child: TextFormField(
                onChanged: (text) {
                  search = text;
                  print(search);
                },
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                onPressed: () {
              settingsProvider.setSearch(false);
            },icon: Icon(Icons.close,size: 20,),),
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(8),
                  hintText: "Search Article",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: AppColors.primary)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: AppColors.primary)
                  ),
                )
            ),
          );
        }
        else
        {
          return Text(AppLocalizations.of(context)!.newsApp);
        }
      },)),
      elevation: 0.0,
      centerTitle: true,
      shape: StadiumBorder(side: BorderSide(color: Colors.transparent)),
      actions: [
        Visibility(
          visible: !Provider.of<settingsProvider>(context).isSearch,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                onPressed: () {
                  Provider.of<settingsProvider>(context, listen:false).setSearch(true);
                },
                icon:Icon(Icons.search,size: 40,) ),
          ),
        ),

      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

