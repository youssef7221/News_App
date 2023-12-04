import 'package:flutter/material.dart';
import 'package:news_app/constants/appcolors.dart';
import 'package:news_app/models/NewsData.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../models/sources.dart';

class NewsItem extends StatelessWidget {
  Articles news;
  NewsItem(this.news);
  @override
  Widget build(BuildContext context){
    final Uri url = Uri.parse(news.url??"");
    return InkWell (
      onTap: () async{
        if (!await launchUrl(url)) {
        throw Exception('Could not launch ');
        }
      },
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height*.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: MediaQuery.of(context).size.height*.25,
                child:CachedNetworkImage(
                  imageUrl: news.urlToImage??"",
                  placeholder: (context, url) => Center(child: LoadingAnimationWidget.waveDots(
                      color: AppColors.primary,
                      size: 50),),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),),
            Text(news.source?.name??"",style: GoogleFonts.poppins(
              fontSize: 10,
              color: Color(0xff79828B),
              fontWeight: FontWeight.w400
            ),),
            Text(news.title??"",style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xff42505C)
            ),),
            Text(news.publishedAt?.substring(0,10)??"",style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.end,)
          ],
        ),
      ),
    );

  }
}
