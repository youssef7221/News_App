import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/api_manager/api_manager.dart';
import 'package:news_app/models/sources.dart';
import 'package:news_app/screens/newsScreen/news.dart';
import 'package:news_app/screens/newsScreen/tabbaritem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/appcolors.dart';


class TabbarController extends StatefulWidget {
  List<Sources> sources;
  TabbarController(this.sources);
  @override
  State<TabbarController> createState() => _TabbarControllerState();
}

class _TabbarControllerState extends State<TabbarController> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedindex = index;
              setState(() {});
            },
            tabs: widget.sources
                .map((source) => TabItem(source.name??"",widget.sources.indexOf(source) == selectedindex ))
                .toList(),
            isScrollable: true,
            indicatorColor: Colors.transparent,
          ),
          FutureBuilder(future: ApiManager.getarticles(widget.sources[selectedindex].id??"",),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  {
                    return Center(
                        child: LoadingAnimationWidget.bouncingBall(
                        color: AppColors.primary,
                        size: 100,
                    )
                    );
                  }
                if (snapshot.hasError)
                  {
                    return Center(child: Text("Something went wrong"),);
                  }
                var News = snapshot.data?.articles??[];
                return Expanded(child: ListView(
                  children: News.map((news) => NewsItem(news)).toList(),
                ));
              },)
        ],
      ),
    );
  }
}
