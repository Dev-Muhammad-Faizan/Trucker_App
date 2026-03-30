import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/Header.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import '../../core/theme.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/bottom_text_link.dart';
import 'login_screen.dart';
import '../../routes/routes_name.dart';

class BrokerRegistrationScreen extends StatefulWidget {
  const BrokerRegistrationScreen({super.key});

  @override
  State<BrokerRegistrationScreen> createState() => _BrokerRegistrationScreenState();
}

class _BrokerRegistrationScreenState extends State<BrokerRegistrationScreen> {
  final _companyNameController = TextEditingController();
  final _contactNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _companyNameController.dispose();
    _contactNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,

      appBar: AppBar(

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Header(
                title: 'Broker Registration',
                subtitle: 'Create your broker account',
                titleColor: AppTheme.primaryTeal,
                subtitleColor: AppTheme.textLight,
                fontFamily: 'Poppins',
                titleFontWeight: FontWeight.w700,
                subtitleFontWeight: FontWeight.w400,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              const SizedBox(height: 24),
              CustomContainer(child: Column(children: [
               CustomTextField(
                 label: 'Company Name',
                 hint: 'Acme Logistics Inc.',
                 controller: _companyNameController,
               ),
               const SizedBox(height: 12),
               CustomTextField(
                 label: 'Contact Name',
                 hint: 'Jane Doe',
                 controller: _contactNameController,
               ),
               const SizedBox(height: 12),
               CustomTextField(
                 label: 'Email Address',
                 hint: 'jane@acmelogistics.com',
                 controller: _emailController,
                 keyboardType: TextInputType.emailAddress,
               ),
               const SizedBox(height: 12),
               CustomTextField(
                 label: 'Phone Number',
                 hint: '(555) 987-6543',
                 controller: _phoneController,
                 keyboardType: TextInputType.phone,
               ),
               const SizedBox(height: 12),
               PrimaryButton(
                 text: 'Create Broker Account',
                 backgroundColor: AppTheme.primaryTeal,
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
                     Navigator.pushReplacementNamed(
                          context,
                          RoutesName.brokerMainScreen,
                        );
                   }
                 },
               ),
             ],)),
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
            ],
          ),
        ),
      ),
    );
  }
}
