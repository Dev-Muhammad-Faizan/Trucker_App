import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/Header.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import '../../core/theme.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/bottom_text_link.dart';
import '../../routes/routes_name.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
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
                title: 'Forgot Password?',
                subtitle: "No worries! Enter your email and we'll send you reset instructions.",
                titleColor: AppTheme.primaryTeal,
                subtitleColor: AppTheme.textLight,
                fontFamily: 'Poppins',
                titleFontWeight: FontWeight.w700,
                subtitleFontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              CustomContainer(
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'Email Address',
                      hint: 'your@email.com',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 12),
                    PrimaryButton(
                      text: 'Send Reset Link',
                      backgroundColor: const Color(
                        0xFF8BA5A2,
                      ), 
                      isLoading: _isLoading,
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
                            const SnackBar(
                              content: Text('Reset link sent to email.'),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              BottomTextLink(
                normalText: "Remember your password?",
                linkText: "Sign In",
                linkColor: AppTheme.primaryTeal,
                onTapped: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutesName.loginScreen,
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 8),
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
