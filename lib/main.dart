import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/auth_provider.dart';
import 'package:state_management/provider/count_provider.dart';
import 'package:state_management/provider/example_one_provider.dart';
import 'package:state_management/provider/favourite_provider.dart';
import 'package:state_management/provider/theme_changer_provider.dart';
import 'package:state_management/provider/value_notify_listener.dart';
import 'package:state_management/provider_screen.dart';
import 'package:state_management/screen/count_example.dart';
import 'package:state_management/screen/dark_theme.dart';
import 'package:state_management/screen/example_one.dart';
import 'package:state_management/screen/favourite/favourite_screen.dart';
import 'package:state_management/screen/login_screen.dart';
import 'package:state_management/stateless_widget.dart';
import 'package:state_management/stateful_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeChanger = Provider.of<ThemeChangerProvider>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData(
                appBarTheme: const AppBarTheme(color: Colors.pink),
                brightness: Brightness.dark,
                primarySwatch: Colors.pink,
                iconTheme: const IconThemeData(color: Colors.pink)),
            home: const LoginScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
