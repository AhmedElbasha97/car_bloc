import 'package:flutter/material.dart';

import 'already_have_an_account.dart';
import 'register_form.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .05),
          const RegisterForm(),
          const SizedBox(height: 16),
          const AlreadyHaveAnAccount(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
