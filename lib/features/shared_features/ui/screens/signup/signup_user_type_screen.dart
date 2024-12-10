import 'package:flutter/material.dart';

import '../../../../../presentation/presentation.dart';

class SignupUserTypeScreen extends StatefulWidget {
  const SignupUserTypeScreen({super.key});

  @override
  State<SignupUserTypeScreen> createState() => _SignupUserTypeScreenState();
}

class _SignupUserTypeScreenState extends State<SignupUserTypeScreen> {
  String? _selectedUserType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select your Account Type',
            style: TextStyles.buttonBold(color: Colors.black54, ),
          ),
          xxlSpacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSelectionContainer(
                      'Enterprise',
                      Assets.entrepriseImage,
                      _selectedUserType == 'Enterprise',
                          () {
                        setState(() {
                          _selectedUserType = 'Enterprise';
                        });
                      },
                    ),
                    const SizedBox(width: 16),
                    _buildSelectionContainer(
                      'Candidate',
                      Assets.candidateImage,
                      _selectedUserType == 'Candidate',
                          () {
                        setState(() {
                          _selectedUserType = 'Candidate';
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Visibility(
                  visible: _selectedUserType!=null,
                  child: Text(
                    'Selected : $_selectedUserType',
                    style:  TextStyles.buttonMedium(
                        color: AppColors.primaryOrange.shade800                  ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionContainer(String title, String imagePath, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.orange.shade400 : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected ? Colors.orange.shade200 : Colors.grey.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.orange.shade600 : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
