import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'screens/dessert_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('th');
  runApp(const DessertApp());
}

class DessertApp extends StatelessWidget {
  const DessertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dessert Collection',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff315c4c),
          brightness: Brightness.light,
        ).copyWith(
          primary: const Color(0xff315c4c),
          secondary: const Color(0xffd97745),
          surface: const Color(0xfffffbf4),
        ),
        scaffoldBackgroundColor: const Color(0xfff4f0e8),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff315c4c),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          color: const Color(0xfffffbf4),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        useMaterial3: true,
      ),
      home: const DessertListScreen(),
    );
  }
}
