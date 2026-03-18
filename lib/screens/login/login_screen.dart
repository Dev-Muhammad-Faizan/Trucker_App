import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/Header.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import '../../core/theme.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/bottom_text_link.dart';
import '../../routes/routes_name.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({ super.key}) ;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Header(
                imagePath: 'assets/images/shiping_icon1.png',
                size: 64,
                title: 'Welcome Back',
                subtitle: 'Sign in to your account',
                titleColor: AppTheme.primaryTeal,
                subtitleColor: AppTheme.textLight,
                fontFamily: 'Poppins',
                titleFontWeight: FontWeight.w700,
                subtitleFontWeight: FontWeight.w400,

              ),
              const SizedBox(height: 24),

              CustomContainer(child: Column(children: [
                CustomTextField(
                  label: 'Email',
                  hint: 'your@email.com',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  label: 'Password',
                  hint: '********',
                  controller: _passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.forgotPasswordScreen);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: AppTheme.textLight,fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                PrimaryButton(
                  text: 'Login',
                  isLoading: _isLoading,
                  backgroundColor: AppTheme.primaryTeal,
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 2));
                    if (mounted) {
                      setState(() {
                        _isLoading = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login Successful!')),
                      );

                      // Navigate to Broker main screen unconditionally
                      // as roles are no longer tracked via provider.
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesName.brokerMainScreen,
                      );
                    }
                  },
                ),
              ],),),
              const SizedBox(height: 24),
              BottomTextLink(
                normalText: "Don't have an account?",
                linkText: "Create Account",
                onTapped: () {
                  Navigator.pushReplacementNamed(context, RoutesName.roleSelectionScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
