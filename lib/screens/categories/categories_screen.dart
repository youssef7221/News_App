import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/sources.dart';
import 'package:news_app/screens/categories/category_item.dart';

import '../../models/categoriesdm.dart';
class CategoriesScreen extends StatelessWidget {
  Function getCategory;
  CategoriesScreen(this.getCategory);
  List<CategoryDm> categoryDm = CategoryDm.getCategoryies();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Text("Pick your category of interest",style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: Color(0xff4F5A69)
          ),),
          Expanded(child: GridView.builder(gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount
            (crossAxisCount: 2,),
            itemBuilder: (context, index) {
          return InkWell(
              onTap: (){
                getCategory(categoryDm[index]);
              },
              child: CategoryItem(index,categoryDm));
            },
            itemCount: categoryDm.length,
          ))
        ],
      ),
    );
  }
}

