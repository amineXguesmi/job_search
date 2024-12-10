import 'package:flutter/material.dart';

import '../../../../../presentation/presentation.dart';

class SignupAuthInformationScreen extends StatefulWidget {
  const SignupAuthInformationScreen({super.key});

  @override
  State<SignupAuthInformationScreen> createState() => _SignupAuthInformationScreenState();
}

class _SignupAuthInformationScreenState extends State<SignupAuthInformationScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _confirmPasswordController=TextEditingController();

  @override
  void dispose() {
   _confirmPasswordController.dispose();
   _passwordController.dispose();
   _emailController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Provide your email',
            style: TextStyles.buttonBold(color: Colors.black54, ),
          ),
          xxsSpacer(),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.xxs, vertical: Dimensions.xxxxs),
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
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email or Phone number",
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.email, color: Colors.orange.shade400),

                // Add contentPadding to center the hint text
                contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0.0),
              ),
            ),
          ),

          xsSpacer(),

          Text(
            'Provide your Password',
            style: TextStyles.buttonBold(color: Colors.black54,),
          ),
          xxsSpacer(),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.xxs, vertical: Dimensions.xxxxs),
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
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.lock, color: Colors.orange.shade400),
                // Add contentPadding to center the hint text
                contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0.0),
              ),
            ),
          ),

          xsSpacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.xxs, vertical: Dimensions.xxxxs),
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
              obscureText: true,
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.lock, color: Colors.orange.shade400),
                // Add contentPadding to center the hint text
                contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
