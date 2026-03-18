import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import 'package:trucker_connect/widgets/custom_text_field.dart';
import 'package:trucker_connect/widgets/primary_button.dart';

import '../../core/theme.dart';
import '../../data/mock_jobs.dart';
import '../../widgets/custom_dropdown_field.dart';

class CreateJob extends StatefulWidget {
  const CreateJob({super.key});

  @override
  State<CreateJob> createState() => _CreateJobState();
}

class _CreateJobState extends State<CreateJob> {
  final _titleController = TextEditingController();
  final _pickupController = TextEditingController();
  final _deliveryController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _rateController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _instructionsController = TextEditingController();
  String? _selectedLoadType;
  String? _selectedVisibility;
  void _onFieldChanged([String? _]) {
    setState(() {}); // Trigggers rebuild to check validation
  }
  bool get _isFormValid {
    return _titleController.text.isNotEmpty &&
        _pickupController.text.isNotEmpty &&
        _deliveryController.text.isNotEmpty &&
        _dateController.text.isNotEmpty &&
        _timeController.text.isNotEmpty &&
        _rateController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _instructionsController.text.isNotEmpty &&
        _selectedLoadType != null &&
        _selectedVisibility != null;
  }
  void _postJob() {
    if (!_isFormValid) return;
    final newJob = {
      'title': _titleController.text,
      'status': 'Open',
      'pickupLocation': _pickupController.text,
      'deliveryLocation': _deliveryController.text,
      'time': '${_dateController.text} - ${_timeController.text}',
      'price': '\$ ${_rateController.text}',
    };
    MockJobs.addJob(newJob);
    Navigator.pop(context, true);
  }
  @override
  void dispose() {
    _titleController.dispose();
    _pickupController.dispose();
    _deliveryController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _rateController.dispose();
    _descriptionController.dispose();
    _instructionsController.dispose();
    super.dispose();
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
                    const Text(
                      'Create New Job',
                      style: TextStyle(
                        color: AppTheme.backgroundWhite,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Post a new load for drivers',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
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
              label: 'Job Title',
                hint: 'Local Freight Pickup',
                controller: _titleController,
                onChanged: _onFieldChanged,
              ),
              const SizedBox(height: 16),

              CustomTextField(
                label: 'Pickup Address',
                hint: '1234 Industrial Blvd, Dallas, TX',
                controller: _pickupController,
                onChanged: _onFieldChanged,
              ),
              const SizedBox(height: 16),

              CustomTextField(
                label: 'Delivery Address',
                hint: '5678 Commerce St, Houston, TX',
                controller: _deliveryController,
                onChanged: _onFieldChanged,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'Date',
                      hint: 'YYYY-MM-DD',
                      controller: _dateController,
                      onChanged: _onFieldChanged,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      label: 'Time',
                      hint: '08:00 AM',
                      controller: _timeController,
                      onChanged: _onFieldChanged,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Payment Rate (\$)',
                hint: '1200',
                keyboardType: TextInputType.number,
                controller: _rateController,
                onChanged: _onFieldChanged,
              ),
              const SizedBox(height: 16),
              CustomDropdownField(
                label: 'Load Type',
                hint: 'Select load type',
                value: _selectedLoadType,
                items: const ['Dry Van', 'Reefer', 'Flatbed', 'Intermodal'],
                onChanged: (val) {
                  setState(() => _selectedLoadType = val);
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Description',
                hint: 'Describe the job details...',
                maxLines: 4,
                controller: _descriptionController,
                onChanged: _onFieldChanged,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Additional Instructions',
                hint: 'Any special requirements or instructions...',
                maxLines: 4,
                controller: _instructionsController,
                onChanged: _onFieldChanged,
              ),
              const SizedBox(height: 16),
              CustomDropdownField(
                label: 'Visibility',
                hint: 'Public - All Drivers',
                value: _selectedVisibility,
                items: const ['Public - All Drivers', 'Private - Invited Only'],
                onChanged: (val) {
                  setState(() => _selectedVisibility = val);
                },
              ),
            ],
          ),
              ),
              const SizedBox(height: 16),
              // Post Job Button
              PrimaryButton(
                text: 'Post Job',
                // Visual cue: fade the red background when disabled
                backgroundColor: _isFormValid
                    ? AppTheme.accentRed
                    : AppTheme.accentRed.withValues(alpha: 0.5),
                // onPressed: _isFormValid ? _postJob : null,
                onPressed: (){
                  if(_isFormValid)
                    {
                      return _postJob();
                    }

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
