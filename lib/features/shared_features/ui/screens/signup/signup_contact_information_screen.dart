import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../../presentation/presentation.dart';

class SignupContactInformationScreen extends StatefulWidget {
  const SignupContactInformationScreen({super.key});

  @override
  State<SignupContactInformationScreen> createState() =>
      _SignupContactInformationScreenState();
}

class _SignupContactInformationScreenState
    extends State<SignupContactInformationScreen> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'US'); // default country

  @override
  void dispose() {
    _addressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Address Input Field
            const Text(
              'Provide your Address',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
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
                controller: _addressController,
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
        
            const Text(
              'Provide your Phone Number',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
              child: InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  setState(() {
                    _phoneNumber = number;
                  });
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG,
                ),
                hintText: 'Phone Number',
        
                inputDecoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 0.0),
                ),
                initialValue: _phoneNumber,
                textFieldController: _phoneNumberController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
