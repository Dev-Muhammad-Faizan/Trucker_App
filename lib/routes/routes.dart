import 'package:flutter/material.dart';
import 'package:trucker_connect/routes/routes_name.dart';
import 'package:trucker_connect/screens/broker/create_job.dart';
import 'package:trucker_connect/screens/broker/record_payment.dart';

import '../screens/login/broker_registration_screen.dart';
import '../screens/login/driver_registration_screen.dart';
import '../screens/login/forgot_password_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/login/role_selection_screen.dart';
import '../screens/login/splash_screen.dart';
import '../screens/broker/broker_main_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesName.roleSelectionScreen:
        return MaterialPageRoute(builder: (_) => const RoleSelectionScreen());
      case RoutesName.driverRegistrationScreen:
        return MaterialPageRoute(
          builder: (_) => const DriverRegistrationScreen(),
        );
      case RoutesName.brokerRegistrationScreen:
        return MaterialPageRoute(
          builder: (_) => const BrokerRegistrationScreen(),
        );
      case RoutesName.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case RoutesName.brokerMainScreen:
        return MaterialPageRoute(builder: (_) => const BrokerMainScreen());

      case RoutesName.createJob:
        return MaterialPageRoute(builder: (_) => const CreateJob());
      case RoutesName.recordPayment:
        return MaterialPageRoute(builder: (_) => const RecordPayment());

      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
