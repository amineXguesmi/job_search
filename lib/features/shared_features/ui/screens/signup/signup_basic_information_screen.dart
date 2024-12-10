import 'package:flutter/material.dart';

import '../../../../../presentation/presentation.dart';

class SignupBasicInformationScreen extends StatefulWidget {
  const SignupBasicInformationScreen({super.key});

  @override
  State<SignupBasicInformationScreen> createState() =>
      _SignupBasicInformationScreenState();
}

class _SignupBasicInformationScreenState
    extends State<SignupBasicInformationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _userNameController.dispose();
    _nameController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _dobController.text =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Provide your name',
            style: TextStyles.buttonBold(
              color: Colors.black54,
            ),
          ),
          xxsSpacer(),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.xxs, vertical: Dimensions.xxxxs),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 1.5, color: Colors.orange.shade400),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.person, color: Colors.orange.shade400),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 0.0),
              ),
            ),
          ),
          xsSpacer(),
      
          // Username input field
          Text(
            'Provide your UserName',
            style: TextStyles.buttonBold(
              color: Colors.black54,
            ),
          ),
          xxsSpacer(),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.xxs, vertical: Dimensions.xxxxs),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 1.5, color: Colors.orange.shade400),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                hintText: "UserName",
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                prefixIcon:
                Icon(Icons.verified_user, color: Colors.orange.shade400),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 0.0),
              ),
            ),
          ),
          xsSpacer(),
      
          Text(
            'Provide your Date of Birth',
            style: TextStyles.buttonBold(
              color: Colors.black54,
            ),
          ),
          xxsSpacer(),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.xxs, vertical: Dimensions.xxxxs),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 1.5, color: Colors.orange.shade400),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _dobController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                hintText: "DD/MM/YYYY",
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                prefixIcon:
                Icon(Icons.calendar_today, color: Colors.orange.shade400),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 0.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
