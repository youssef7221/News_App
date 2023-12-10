import 'package:flutter/material.dart';
import 'package:news_app/provider/settings_provider.dart';
import 'package:news_app/screens/homescreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/screens/splash_screen/splash.dart';
import 'package:news_app/shared_pref/shared_pref.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.startCache();
  runApp( ChangeNotifierProvider(
    create: (context) => settingsProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late settingsProvider provider;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.route,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'),
      ],
      locale:Locale(SharedPref.getData(key:"language") == true ? 'ar' : 'en' ),
      routes: {
        HomeScreen.route :(context) =>  HomeScreen(),
        SplashScreen.route : (context) => SplashScreen()
      },
    );
  }
}

