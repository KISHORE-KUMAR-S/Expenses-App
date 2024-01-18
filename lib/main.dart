import 'package:dynamic_color/dynamic_color.dart';
import 'package:expense_app/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: lightDynamic),
        darkTheme: ThemeData(colorScheme: darkDynamic),
        home: const Expenses(),
      ),
    );

    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: const Expenses(),

    //Custom Theme
    //   // theme: ThemeData().copyWith(
    //   //   scaffoldBackgroundColor: Color.fromARGB(255, 255, 0, 0),
    //   // ),

    //Default theme
    //   // theme: ThemeData.light(),
    //   // darkTheme: ThemeData.dark(),
    // ),
  }
}
