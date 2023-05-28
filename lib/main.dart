import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/hourlyScreen.dart';
import './provider/weatherProvider.dart';
import 'screens/fiveDaysScreen.dart';
import 'screens/homeScreen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        title: 'Flutter Weather',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.deepPurple,
            ),
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        ),
        home: HomeScreen(),
        routes: {
          FiveDaysScreen.routeName: (myCtx) => const FiveDaysScreen(),
          HourlyScreen.routeName: (myCtx) => const HourlyScreen(),
        },
      ),
    );
  }
}
