import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trucker_connect/data/mock_drivers.dart';
import 'package:trucker_connect/widgets/Header.dart';
import 'package:trucker_connect/widgets/broker/rating_stars.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import 'package:trucker_connect/widgets/custom_text_field.dart';
import 'package:trucker_connect/widgets/primary_button.dart';
import '../../core/theme.dart';

class DriverReview extends StatefulWidget {
  final String driverId;

  const DriverReview({super.key, required this.driverId});

  @override
  State<DriverReview> createState() => _DriverReviewState();
}

class _DriverReviewState extends State<DriverReview> {
  int punctuality = 0;
  int safety = 0;
  int compliance = 0;
  int professionalism = 0;
  bool isBlocked = false;

  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _commentController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  bool get _isFormValid =>
      punctuality > 0 &&
      safety > 0 &&
      compliance > 0 &&
      professionalism > 0 ;

  void _submitReview() {
    if (!_isFormValid) return;

    final driverIndex = MockDrivers.drivers.indexWhere((d) => d['id'] == widget.driverId);
    if (driverIndex != -1) {
      if (isBlocked) {
        MockDrivers.drivers[driverIndex]['isBlocked'] = true;
      }
      
      final currentRating = MockDrivers.drivers[driverIndex]['rating'] is double
          ? MockDrivers.drivers[driverIndex]['rating']
          : double.tryParse(MockDrivers.drivers[driverIndex]['rating'].toString()) ?? 0.0;
          
      final avgNewRating = (punctuality + safety + compliance + professionalism) / 4.0;
      MockDrivers.drivers[driverIndex]['rating'] = double.parse(((currentRating + avgNewRating) / 2).toStringAsFixed(1));
    }
    
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: AppBar(
          backgroundColor: AppTheme.primaryTeal,
          elevation: 0,
          leadingWidth: double.infinity,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: AppTheme.backgroundWhite, size: 20),
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
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Header(
                      title: 'Driver Review',
                      titleSize: 24,
                      titleColor: AppTheme.backgroundWhite,
                      titleFontWeight: FontWeight.w700,
                      space: 4,
                      subtitle: 'Rate driver performance',
                      subtitleSize: 14,
                      subtitleColor: AppTheme.backgroundWhite.withValues(alpha: 0.8),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            children: [
              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Header(
                        title: 'Overall Rating',
                        subtitle: 'Rate all categories',
                        titleSize: 14,
                        subtitleSize: 16,
                        titleFontWeight: FontWeight.w400,
                        subtitleFontWeight: FontWeight.w400,
                        titleColor: AppTheme.textDark,
                        subtitleColor: AppTheme.textLight,
                      ),
                    ),

                    const SizedBox(height: 16),
                    const Divider(color: AppTheme.inputBorder),
                    const SizedBox(height: 12),
                    _buildRatingCategory('Punctuality', punctuality, (v) => setState(() => punctuality = v)),
                    const SizedBox(height: 20),
                    _buildRatingCategory('Safety', safety, (v) => setState(() => safety = v)),
                    const SizedBox(height: 20),
                    _buildRatingCategory('Compliance', compliance, (v) => setState(() => compliance = v)),
                    const SizedBox(height: 20),
                    _buildRatingCategory('Professionalism', professionalism, (v) => setState(() => professionalism = v)),

                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Additional Comments Section
              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: _commentController,
                      hint: 'Share your experience with this driver...',
                      label: 'Additional Comments',
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              CustomContainer(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Block driver from future projects',
                            style: TextStyle(
                              color: AppTheme.primaryTeal,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'This driver will not be able to accept your jobs',
                            style: TextStyle(
                              color: AppTheme.textLight.withValues(alpha: 0.8),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    CupertinoSwitch(
                      value: isBlocked,
                      onChanged: (value) {
                        setState(() {
                          isBlocked = value;
                        });
                      },
                      activeTrackColor: AppTheme.primaryTeal,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Submit Button
              PrimaryButton(
                text: 'Submit Review',
                backgroundColor: _isFormValid ? AppTheme.primaryTeal : AppTheme.primaryTeal.withValues(alpha: 0.5),
                onPressed: _isFormValid ? _submitReview : () {},
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingCategory(String title, int currentRating, ValueChanged<int> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(
          title: title,

            titleColor: AppTheme.primaryTeal,
            titleSize: 14,
             titleFontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 8),
        RatingStars(
          rating: currentRating,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

