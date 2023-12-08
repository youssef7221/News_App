import 'package:flutter/material.dart';
import 'package:news_app/constants/appcolors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/shared_pref/shared_pref.dart';
import 'package:provider/provider.dart';

import '../../provider/settings_provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late settingsProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    bool isArabic = provider.isArEnabled();
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 30)),
        Row(
          children: [
            Text("(AR)",style: TextStyle(
              fontSize: 20
            ),),
            Spacer(),
            Switch(value: isArabic, onChanged: (newvalue) {
            isArabic = newvalue;
            if (isArabic == true)
              {
                SharedPref.setData(key: "language", value: true);
                provider.setCurrentLocale('ar');
                provider.notifyListeners();
              }
            else {
              SharedPref.setData(key: "language", value: false);
              provider.setCurrentLocale('en');
                  provider.notifyListeners();
            }
            },activeColor: AppColors.primary,)
          ],
        )
      ],
    );
  }
}
