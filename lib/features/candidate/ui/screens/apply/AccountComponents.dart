import 'package:flutter/material.dart';

import '../../../../shared_features/ui/widgets/text_component.dart';
import '../../../data/models/user.dart';

class AccountComponents extends StatefulWidget {
  User user;
  TextEditingController usernameController;
  TextEditingController passwordController;
  TextEditingController emailController;
  List<GlobalKey<FormState>> formKeys;

  AccountComponents({
    super.key,
    required this.user,
    required this.emailController,
    required this.passwordController,
    required this.usernameController,
    required this.formKeys,
  });

  @override
  State<AccountComponents> createState() => _AccountComponentsState();
}

class _AccountComponentsState extends State<AccountComponents> {
  List<DropdownMenuItem<String>> typeOptions = const [
    DropdownMenuItem(
      child: Text('Applicant'),
      value: "Applicant",
    ),
    DropdownMenuItem(
      child: Text('Company'),
      value: "Company",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKeys[1],
      child: Column(
        children: [
          const SizedBox(height: 15),
          TextFieldGenerator(
            label: "Email Address",
            controller: widget.emailController,
            keyboardType: TextInputType.text,
            validatorText: "Email is required",
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Flexible(
                  child: TextFieldGenerator(
                label: "User Name",
                controller: widget.usernameController,
                keyboardType: TextInputType.text,
                validatorText: "User Name is required",
              )),
            ],
          )
        ],
      ),
    );
  }
}
