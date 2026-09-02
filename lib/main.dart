// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:zad/features/pages/home_page.dart';
import 'package:zad/features/pages/login_page.dart';
import 'package:zad/features/pages/not_found_page.dart';
import 'package:zad/features/pages/profile_page.dart';
import 'package:zad/features/pages/register_page.dart';
import 'package:zad/features/pages/splash_page.dart';
import 'package:zad/features/pages/devotional_pages.dart';
import 'package:zad/features/pages/library_page.dart';
import 'package:zad/features/pages/cart_page.dart';
import 'package:zad/features/pages/book_details_page.dart';
import 'package:zad/features/models/product_model.dart';
import 'package:zad/features/state/cart_provider.dart';
import 'package:zad/features/state/favorites_provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: const ZadApp(),
    ),
  );
}

class ZadApp extends StatelessWidget {
  const ZadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('ar'), Locale('en')],
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child ?? const SizedBox.shrink(),
      ),
      initialRoute: "splash",
      routes: {
        "/": (context) => const HomePage(),
        "splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
        "/profile": (context) => const ProfilePage(),
        "/quran": (context) => const QuranPage(),
        "/azkar": (context) => const AzkarPage(),
        "/hadith": (context) => const HadithPage(),
        "/tasbeeh": (context) => const TasbeehPage(),
        "/library": (context) => const LibraryPage(),
        "/cart": (context) => const CartPage(),
        "/book-details": (context) => BookDetailsPage(
          product: ModalRoute.of(context)!.settings.arguments as ProductModel,
        ),
      },

      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const NotFoundPage()),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        colorSchemeSeed: const Color(0xFF0B6B5B),
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: const Color(0xFF0B6B5B),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0B6B5B),
            alignment: Alignment.center,
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: const AppBarTheme(
          backgroundColor: const Color(0xFF0B6B5B),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorSchemeSeed: const Color(0xFF0B6B5B),
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0B6B5B),
            alignment: Alignment.center,
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      themeMode: ThemeMode.system,
    );
  }
}
