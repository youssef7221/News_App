import 'package:flutter/material.dart';
import 'package:news_app/constants/appcolors.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isArabic = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 30)),
        Row(
          children: [
            Text("العربية(AR)",style: TextStyle(
              fontSize: 20
            ),),
            Spacer(),
            Switch(value: isArabic, onChanged: (newvalue) {
              isArabic = newvalue;
              setState(() {});
            },activeColor: AppColors.primary,)
          ],
        )
      ],
    );
  }
}
