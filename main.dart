import 'package:flutter/material.dart';
import 'package:exp_yabets/widget/expenses.dart';

var KcolorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 255, 94, 45),
);
var kdarkcolorscheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
void main() =>
// this commented part the the the app unportable

//WidgetsFlutterBinding.ensureInitialized();

    //SystemChrome.setPreferredOrientations([
    //DeviceOrientation.portraitUp,
    //]).then((fn) {
    runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kdarkcolorscheme,
          cardTheme: const CardTheme().copyWith(
            color: kdarkcolorscheme.secondaryContainer,
            shadowColor: Colors.black,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kdarkcolorscheme.primaryContainer,
                foregroundColor: kdarkcolorscheme.onPrimaryContainer),
          ),
        ),
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: KcolorScheme,
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: KcolorScheme.onPrimaryContainer,
              foregroundColor: KcolorScheme.primaryContainer),
          cardTheme: const CardTheme().copyWith(
            color: KcolorScheme.secondaryContainer,
            shadowColor: Colors.black,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: KcolorScheme.primaryContainer),
          ),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: KcolorScheme.onSecondaryContainer,
                  fontSize: 17)),
        ),
        home: const Expenses(),
      ),
    );
  //  });
