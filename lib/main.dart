import 'package:flutter/material.dart';
import 'package:trucker_connect/routes/routes.dart';
import 'package:trucker_connect/routes/routes_name.dart';
import 'core/theme.dart';

void main() {
  runApp(const TruckerConnectApp());
}

class TruckerConnectApp extends StatelessWidget {
  const TruckerConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TruckerConnect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppTheme.backgroundWhite,
        appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.backgroundWhite,
        )
      ),
     initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
