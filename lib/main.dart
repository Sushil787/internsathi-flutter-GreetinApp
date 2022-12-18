import 'package:approvider/provider/theme_provider.dart';
import 'package:approvider/provider/time_provider.dart';
import 'package:approvider/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ((context) => ThemeNotifier())),
          ChangeNotifierProvider(create: (context) => TimeProvider())
        ],
        child: Consumer<ThemeNotifier>(
            builder: (context, theme, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: '',
                theme: theme.darkTheme ? dark : light,
                home: const HomeScreen())));
  }
}
