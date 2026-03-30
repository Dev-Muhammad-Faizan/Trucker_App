import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/Header.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import '../../core/theme.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/bottom_text_link.dart';
import 'login_screen.dart';
import '../../routes/routes_name.dart';

class DriverRegistrationScreen extends StatefulWidget {
  const DriverRegistrationScreen({super.key});

  @override
  State<DriverRegistrationScreen> createState() => _DriverRegistrationScreenState();
}

class _DriverRegistrationScreenState extends State<DriverRegistrationScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _licenseController = TextEditingController();
  final _truckInfoController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _licenseController.dispose();
    _truckInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              forceMaterialTransparency: true,
              elevation: 0,
              floating: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              Header(title: 'Driver Registration',
                subtitle: 'Create your driver account',
              fontFamily: 'Poppins',
              titleColor: AppTheme.primaryTeal,
              subtitleColor: AppTheme.textLight,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              const SizedBox(height: 24),
              CustomContainer(child: Column(
                children: [
                  CustomTextField(
                    label: 'Full Name',
                    hint: 'John Smith',
                    controller: _nameController,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: 'Phone Number',
                    hint: '(555) 123-4567',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: 'Email Address',
                    hint: 'john@email.com',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: 'Driver License Number',
                    hint: '01234567',
                    controller: _licenseController,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: 'Truck Information (Optional)',
                    hint: '2023 Freightliner Cascadia',
                    controller: _truckInfoController,
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(
                    text: 'Register',
                    backgroundColor: AppTheme.accentRed,
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
                          const SnackBar(content: Text('Registration Successful!')),
                        );
                         Navigator.pushReplacementNamed(context, RoutesName.drivermianScreen);
                      }
                    },
                  ),
                ],
              )),
              const SizedBox(height: 24),
              BottomTextLink(
                normalText: "Already have an account?",
                linkText: "Login",
                onTapped: () {
                   Navigator.pushReplacementNamed(
                    context,
                    RoutesName.loginScreen,
                  );
                },
              ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
