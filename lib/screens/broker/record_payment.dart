import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/Header.dart';

import '../../core/theme.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_dropdown_field.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
class RecordPayment extends StatefulWidget {
  const RecordPayment({super.key});

  @override
  State<RecordPayment> createState() => _RecordPaymentState();
}

class _RecordPaymentState extends State<RecordPayment> {
  final _IDController = TextEditingController();
  final _NameController = TextEditingController();
  final _AmountController = TextEditingController();

  final _descriptionController = TextEditingController();
   String? _selectedPaymentType;
  void _onFieldChanged([String? _]) {
    setState(() {});
  }
  bool get _isFormValid {
    return _IDController.text.isNotEmpty &&
        _NameController.text.isNotEmpty &&
        _AmountController.text.isNotEmpty &&
        _selectedPaymentType != null ;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: AppBar(
            backgroundColor: AppTheme.primaryTeal,
            elevation: 0,
            leadingWidth: double.infinity,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppTheme.backgroundWhite),
                    onPressed: () => Navigator.pop(context),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                        'Back',
                        style: TextStyle(
                            color: AppTheme.backgroundWhite,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500
                        )
                    ),
                  )
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, bottom: 24.0, right: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(title: 'Record Payment',titleSize: 24,),
                      Header(
                       subtitle:  'Mark invoice as paid',
                       subtitleColor: AppTheme.subtitle,
                          subtitleSize: 16,
                          fontFamily: 'Poppins',
                          subtitleFontWeight: FontWeight.w400,

                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomContainer(
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'Invoice ID',
                      hint: 'INV-2026-001',
                      controller: _IDController,
                      onChanged: _onFieldChanged,
                    ),
                    const SizedBox(height: 16),

                    CustomTextField(
                      label: 'Driver Name',
                      hint: 'John Smith',
                      controller:_NameController,
                      onChanged: _onFieldChanged,
                    ),
                    const SizedBox(height: 16),

                    CustomTextField(
                      label: 'Amount',
                      hint: '1200',
                      controller: _AmountController,
                      onChanged: _onFieldChanged,
                    ),
                    const SizedBox(height: 16),

                    CustomDropdownField(
                      label: 'Payment Method',
                      hint: 'Select payment method',
                      value: _selectedPaymentType,
                      items: const ['Credit Card', 'PayPal', 'Bank Transfer'],
                      onChanged: (val) {
                        setState(() => _selectedPaymentType = val);
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Reference Note',
                      hint: 'payment confirmation Number or additional notes..',
                      maxLines: 2,
                      controller: _descriptionController,
                      onChanged: _onFieldChanged,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                text: 'Mark payment Sent',
                backgroundColor: _isFormValid
                    ? AppTheme.accentRed
                    : AppTheme.accentRed.withValues(alpha: 0.5),
                onPressed: (){
                  if(_isFormValid)
                    {}
                  else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Center(
                            child: Text(
                              'Please fill all required details',
                              style: TextStyle(fontFamily: 'Poppins'),
                            ),
                          ),
                          backgroundColor: AppTheme.accentRed,
                          duration: Duration(milliseconds: 500),
                        ),
                      );                    }
                },
              ),
              const SizedBox(height: 12),

            ],
          ),
        ),
      ),
    );
  }
}
