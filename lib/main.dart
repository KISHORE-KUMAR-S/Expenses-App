import 'package:dynamic_color/dynamic_color.dart';
import 'package:expense_app/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// var kColorScheme = ColorScheme.fromSeed(
//     seedColor: const Color.fromARGB(255, 96, 56, 181),
//     brightness: Brightness.light);

// var kDarkColorScheme = ColorScheme.fromSeed(
//     seedColor: const Color.fromARGB(255, 5, 99, 125),
//     brightness: Brightness.dark);

void main() {
  runApp(
    DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (context) {
            bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
            Color? statusBarColor = isDarkMode
                ? lightDynamic
                    ?.onPrimaryContainer // Set the color for light mode
                : darkDynamic
                    ?.onPrimaryContainer; // Set the color for dark mode

            Brightness statusBarBrightness = isDarkMode
                ? Brightness.dark // Set brightness for light mode
                : Brightness.light; // Set brightness for dark mode
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                  statusBarColor: statusBarColor,
                  statusBarBrightness:
                      statusBarBrightness // Set the color you want
                  ),
              child: MaterialApp(
                theme: ThemeData(
                  colorScheme: lightDynamic,
                  useMaterial3: true,
                ).copyWith(
                  appBarTheme: const AppBarTheme().copyWith(
                    backgroundColor: lightDynamic?.onPrimaryContainer,
                    foregroundColor: lightDynamic?.primaryContainer,
                  ),
                  cardTheme: CardTheme(
                    color: lightDynamic?.secondaryContainer,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  ),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightDynamic?.primaryContainer,
                      foregroundColor: lightDynamic?.onPrimaryContainer,
                    ),
                  ),
                ),
                darkTheme: ThemeData(
                  colorScheme: darkDynamic,
                  useMaterial3: true,
                ).copyWith(
                  colorScheme: darkDynamic,
                  cardTheme: CardTheme(
                    color: darkDynamic?.secondaryContainer,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  ),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkDynamic?.primaryContainer,
                      foregroundColor: darkDynamic?.onPrimaryContainer,
                    ),
                  ),
                ),
                home: const Expenses(),
              ),
            );
          },
        ),
      ),
    ),

    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: const Expenses(),

    //   // Custom Theme
    //   theme: ThemeData().copyWith(
    //     // scaffoldBackgroundColor: const Color.fromARGB(255, 255, 0, 0),
    //     colorScheme: kColorScheme,
    //     appBarTheme: const AppBarTheme().copyWith(
    //       backgroundColor: kColorScheme.onPrimaryContainer,
    //       foregroundColor: kColorScheme.primaryContainer,
    //     ),
    //     cardTheme: CardTheme(
    //       color: kColorScheme.secondaryContainer,
    //       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    //     ),
    //     elevatedButtonTheme: ElevatedButtonThemeData(
    //       style: ElevatedButton.styleFrom(
    //           backgroundColor: kColorScheme.primaryContainer),
    //     ),
    //     textTheme: ThemeData().textTheme.copyWith(
    //           titleLarge: TextStyle(
    //               fontSize: 20.0, color: kColorScheme.onSecondaryContainer),
    //         ),
    //   ),
    // darkTheme: ThemeData.dark().copyWith(
    //   colorScheme: kDarkColorScheme,
    //   cardTheme: CardTheme(
    //     color: kDarkColorScheme.secondaryContainer,
    //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    //   ),
    //   elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ElevatedButton.styleFrom(
    //       backgroundColor: kDarkColorScheme.primaryContainer,
    //       foregroundColor: kDarkColorScheme.onPrimaryContainer,
    //     ),
    //   ),
    // ),
    // themeMode: ThemeMode.system,

    //   //Default theme
    //   //   // theme: ThemeData.light(),
    //   //   // darkTheme: ThemeData.dark(),
    //   // ),
    // ),
  );
}
